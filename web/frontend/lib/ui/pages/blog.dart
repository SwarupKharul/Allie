import 'package:devspace/ui/widgets/appbar.dart';
import 'package:devspace/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
          child: Row(
            children: [
              Expanded(
                  flex: 60,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      height: 280,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 0,
                          color: Color(0xffF6F6EE),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dementia Chores",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 40),
                                ),
                                Text(
                                  "- By Srishti Chaurasia",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "The standard Lorem Ipsum passage, used since the 1500s Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea.",
                                  style: Theme.of(context).textTheme.button,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),

              //Side 2
              Expanded(
                  flex: 40,
                  child: Column(
                    children: [
                      //first
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 0,
                              color: Color(0xffF6F6EE),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Statistics",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    Text(
                                      "Dementia Chores By Srishti Chaurasia",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trending Today",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    "Dementia Chores By Srishti Chaurasia",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 0,
                            color: Color(0xffF6F6EE),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recent read",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    "Welcome Blog by Srishti Chaurasia",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
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
