import 'package:devspace/core/services/synthapi.dart';
import 'package:devspace/ui/widgets/appbar.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class SynthPage extends StatefulWidget {
  const SynthPage({Key? key}) : super(key: key);

  @override
  State<SynthPage> createState() => _SynthPageState();
}

class _SynthPageState extends State<SynthPage> {
  List<String> data = ["0", "0", "0"];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    data = await Syn().data();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'blogBg.png',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: myNav(context),
        ),
        Padding(
            padding: const EdgeInsets.only(
                left: 200.0, right: 200, top: 170, bottom: 30),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Color(0xffF6F6EE),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 23, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "SNX 35.5",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "STACKED VALUE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "3.96%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "EARNING",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "SNX 39.33",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "ACTIVE DEBT",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 0,
                            color: Color(0xffF6F6EE),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 23, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Mint Your Synths",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Mint synths to grow your earnings",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 20,
                                              ),
                                        ),
                                        FloatingActionButton.small(
                                          onPressed: () {
                                            Syn().synthmint().whenComplete(() =>
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content:
                                                            Text("Success"))));
                                          },
                                          elevation: 0,
                                          backgroundColor: Colors.black,
                                          child: Icon(Icons.auto_awesome),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 0,
                            color: Color(0xffF6F6EE),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 23, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Invest In other Synths",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Invest in assets without actually\nowning the assets",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 20,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Color(0xffF6F6EE),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    data[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total sUSD Supply",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    data[1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total sBTC Supply",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    data[2],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total sEther Supply",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150.0, vertical: 25),
              child: Divider(
                color: Colors.grey,
                thickness: 3,
              ),
            )),
        Positioned(
          child: Image.asset(
            "blogOrangePot.png",
            width: 75,
          ),
          bottom: 30,
          left: 170,
        ),
        Positioned(
          child: Image.asset(
            "blogBluePot.png",
            width: 75,
          ),
          bottom: 30,
          right: 170,
        ),
      ],
    ));
  }
}
