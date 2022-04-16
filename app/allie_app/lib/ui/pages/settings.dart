import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetView extends StatefulWidget {
  const SetView({Key? key}) : super(key: key);

  @override
  State<SetView> createState() => _SetViewState();
}

class _SetViewState extends State<SetView> {
  bool v1 = true;
  bool v2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Location Tracking",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontSize: 20)),
            ),
            Expanded(
              child: SizedBox(),
            ),
            CupertinoSwitch(
              activeColor: Color(0xff3E8A7A),
              value: v2,
              onChanged: (value) {
                setState(() {
                  v2 = value;
                });
              },
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.medication,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Meds Reminder",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontSize: 20)),
            ),
            Expanded(
              child: SizedBox(),
            ),
            CupertinoSwitch(
              activeColor: Color(0xff3E8A7A),
              value: v1,
              onChanged: (value) {
                setState(() {
                  v1 = value;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
