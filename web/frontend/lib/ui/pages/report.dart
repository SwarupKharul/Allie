import 'package:devspace/ui/widgets/appbar.dart';
import 'package:devspace/ui/widgets/chart.dart';
import 'package:flutter/material.dart';

class ReportPage1 extends StatefulWidget {
  const ReportPage1({Key? key}) : super(key: key);

  @override
  State<ReportPage1> createState() => _ReportPage1State();
}

Widget listItem(BuildContext context, List<String> data) {
  List<Widget> dl = List<Widget>.generate(
      data.length,
      (index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              data[index],
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
            ),
          ));
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black, width: 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...dl,
      ],
    ),
  );
}

Widget listItemL(BuildContext context, List<String> data) {
  List<Widget> dl = List<Widget>.generate(data.length, (index) {
    if (index == 0) {
      return (data[index] == "y")
          ? Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
            )
          : Icon(
              Icons.error_outline,
              color: Colors.red,
            );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        data[index],
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
      ),
    );
  });
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black, width: 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...dl,
      ],
    ),
  );
}

class _ReportPage1State extends State<ReportPage1> {
  Widget listItem(BuildContext context, List<String> data) {
    List<Widget> dl = List<Widget>.generate(
        data.length,
        (index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data[index],
                style:
                    Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
              ),
            ));
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...dl,
        ],
      ),
    );
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
            child: TestReport()),
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

class TestReport extends StatefulWidget {
  const TestReport({Key? key}) : super(key: key);

  @override
  State<TestReport> createState() => _TestReportState();
}

class _TestReportState extends State<TestReport> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 60,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: listItem(
                      context, ["12-04-65", "Score: 9/15", "Download"])),
            )),

        //Side 2
        Expanded(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //first
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const CircleAvatar(
                              radius: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Name : Suryakant Agrawal",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Age  : 85 yrs",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Progress Graph",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SimpleTimeSeriesChart.withSampleData(),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "You're doing great , Keep Going",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class LocReport extends StatefulWidget {
  const LocReport({Key? key}) : super(key: key);

  @override
  State<LocReport> createState() => _LocReportState();
}

class _LocReportState extends State<LocReport> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 60,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: listItemL(context,
                      ["y", "12-04-65", "41°24'12.2″N", "23:43:09", "Track"])),
            )),

        //Side 2
        Expanded(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //first
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const CircleAvatar(
                              radius: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Name : Suryakant Agrawal",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Age  : 85 yrs",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Current Location",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Image.asset("map.png"),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "In Perimeter",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class ReportPage2 extends StatefulWidget {
  const ReportPage2({Key? key}) : super(key: key);

  @override
  State<ReportPage2> createState() => _ReportPage2State();
}

class _ReportPage2State extends State<ReportPage2> {
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
            child: LocReport()),
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
