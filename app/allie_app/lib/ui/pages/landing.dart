import 'package:allie_app/ui/pages/home.dart';
import 'package:allie_app/ui/pages/record.dart';
import 'package:allie_app/ui/pages/settings.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<IconData> icons = [Icons.home, Icons.mic_rounded, Icons.settings];
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
                    // Text(
                    //   "Welcome",
                    //   style: Theme.of(context).textTheme.button!.copyWith(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   "Back!",
                    //   style: Theme.of(context).textTheme.button!.copyWith(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20),
                    // ),
                    if (icons[1] == Icons.home) HomeView(),
                    if (icons[1] == Icons.settings) SetView(),
                    if (icons[1] == Icons.mic_rounded) RecView(),
                  ]))),
      floatingActionButton: FloatingActionButton.large(
        child: Icon(
          icons[1],
          color: Colors.red,
          size: 40,
        ),
        elevation: 0,
        onPressed: () {},
        backgroundColor: Color(0xffEAEAE4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color(0xffEAEAE4),
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      var temp = icons[0];
                      icons[0] = icons[1];
                      icons[1] = temp;
                    });
                  },
                  icon: Icon(
                    icons[0],
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      var temp = icons[2];
                      icons[2] = icons[1];
                      icons[1] = temp;
                    });
                  },
                  icon: Icon(
                    icons[2],
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
