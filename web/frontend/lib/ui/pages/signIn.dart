import 'package:devspace/core/services/auth.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key, required this.auth}) : super(key: key);

  Auth auth;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  // GlobalKey<FormState> _formKey = GlobalKey();

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "logo.png",
                          width: 40,
                        ),
                        SizedBox(width: 20),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "allie",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 130,
                    ),
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Back!",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "We are so happy to have you here",
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
                              "Email",
                              style: Theme.of(context).textTheme.button,
                            ),
                            TextFormField(
                              controller: _email,
                            ),
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
                            TextFormField(
                              controller: _password,
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot Password",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 24),
                          child: GreenButton(
                              text: "Sign In",
                              height: 50,
                              onp: () {
                                widget.auth.login(_email.text, _password.text);
                                Navigator.of(context).pop();
                              },
                              width: 350),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "OR",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SizedBox(
                            width: 350,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Sign In with Google",
                                style: Theme.of(context).textTheme.button,
                              ),
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(BorderSide(
                                      width: 2, color: Colors.black))),
                            ),
                          ),
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
        ),
      ],
    ));
  }
}
