import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'registerBg.png',
            fit: BoxFit.fill,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "allie",
                      )),
                  SizedBox(
                    height: 130,
                  ),
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Create your free account now",
                    style: Theme.of(context).textTheme.button,
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Flexible(
              child: Container(),
              flex: 33,
            ),
            Expanded(
              flex: 46,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Re-enter Password",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextFormField(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GreenButton(
                            text: "Register",
                            height: 50,
                            onp: () {},
                            width: 350),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 20,
            ),
          ],
        ),
      ],
    ));
  }
}
