import 'package:devspace/ui/pages/signUp.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "allie",
                      )),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 189,
                    height: 57,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "About Us",
                        style: Theme.of(context).textTheme.button,
                      ),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(width: 2, color: Colors.black))),
                    ),
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  SizedBox(
                    width: 189,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff5A9A8B))),
                    ),
                  ),
                ],
              ),
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
                  GreenButton(
                      text: "Get Started", height: 50, onp: () {}, width: 350)
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
