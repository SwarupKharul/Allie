import 'package:devspace/ui/pages/signIn.dart';
import 'package:devspace/ui/pages/signUp.dart';
import 'package:devspace/ui/widgets/appbar.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class Landing2 extends StatefulWidget {
  const Landing2({Key? key}) : super(key: key);

  @override
  State<Landing2> createState() => _Landing2State();
}

class _Landing2State extends State<Landing2> {
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: myNav(context),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "We remember",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "thier love when they can",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "no longer remember",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
