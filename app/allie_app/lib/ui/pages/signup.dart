import 'package:allie_app/core/services/auth.dart';
import 'package:allie_app/ui/widgets/greenButton.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "allie",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(fontSize: 30),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "Back!",
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We are so happy to have you here",
                style: Theme.of(context).textTheme.button,
              ),
              SizedBox(height: 20),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Re-enter Password",
                      style: Theme.of(context).textTheme.button,
                    ),
                    TextFormField(
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: GreenButton(
                      text: "Sign Up",
                      height: 50,
                      onp: () {
                        widget.auth.login(_email.text, _password.text);
                      },
                      width: 350),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
