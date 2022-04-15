import 'package:devspace/ui/widgets/appbar.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

class DrawTestPage extends StatefulWidget {
  const DrawTestPage({Key? key}) : super(key: key);

  @override
  State<DrawTestPage> createState() => _DrawTestPageState();
}

class _DrawTestPageState extends State<DrawTestPage> {
  PainterController _controller = _newController();

  static PainterController _newController() {
    PainterController controller = new PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'landingPg.png',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: myNav(context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 99),
          child: Divider(
            color: Colors.black,
            thickness: 5,
          ),
        ),
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width * 0.15,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Card(
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  side: BorderSide(color: Colors.black, width: 5)),
              child: Painter(_controller),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Clock Test 1: Draw a circle",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 30),
                ),
                SizedBox(
                  width: 50,
                ),
                GreenButton(
                    text: "Submit",
                    height: 50,
                    onp: () {
                      _controller.clear();
                    },
                    width: 150)
              ],
            ),
          ),
        )
      ],
    ));
  }
}
