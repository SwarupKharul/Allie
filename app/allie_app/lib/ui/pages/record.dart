import 'dart:async';
import 'dart:io';

import 'package:allie_app/core/services/symbal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class RecView extends StatefulWidget {
  RecView({
    required this.symbal,
    Key? key,
  }) : super(key: key);
  Symbal symbal;

  @override
  State<RecView> createState() => _RecViewState();
}

class _RecViewState extends State<RecView> {
  late FlutterSoundRecorder _recordingSession;
  late String pathToAudio;
  String _timerText = " ";
  bool isRecording = false;
  late List<RecordModel> data;

  void initState() {
    super.initState();

    initializer();
  }

  void initializer() async {
    pathToAudio = '/sdcard/Download/temp.wav';
    _recordingSession = FlutterSoundRecorder();
    await _recordingSession.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await _recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
    //await initializeDateFormatting();
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> startRecording() async {
    Directory directory = Directory(path.dirname(pathToAudio));
    if (!directory.existsSync()) {
      directory.createSync();
    }
    _recordingSession.openAudioSession();
    await _recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription _recorderSubscription =
        _recordingSession.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      setState(() {
        _timerText = timeText.substring(0, 8);
      });
    });
    _recorderSubscription.cancel();
  }

  Future<String?> stopRecording() async {
    _recordingSession.closeAudioSession();
    return await _recordingSession.stopRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        (isRecording) ? "Recording..." : " Record",
        style: Theme.of(context).textTheme.button!.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 40,
      ),
      FloatingActionButton(
        onPressed: () {
          if (isRecording) {
            stopRecording();
            widget.symbal.history();
          } else {
            startRecording();
          }
          setState(() {
            isRecording = !isRecording;
          });
        },
        backgroundColor: Colors.red,
        child: (!isRecording)
            ? Icon(
                Icons.fiber_manual_record,
                color: Colors.white,
              )
            : Icon(
                Icons.pause,
                color: Colors.white,
              ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        "Your Summaries",
        style: Theme.of(context).textTheme.button!.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.symbal.data[index].date,
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.symbal.data[index].text.join(","),
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: widget.symbal.data.length,
      )),
    ]);
  }
}

class RecordModel {
  String date;
  List text;

  RecordModel(this.date, this.text);
}
