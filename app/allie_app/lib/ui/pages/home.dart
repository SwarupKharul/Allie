import 'package:allie_app/ui/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              child: SizedBox(
                width: 50,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Suryakant Agrawal",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Phone No:",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Text("+91 782836942", style: Theme.of(context).textTheme.button)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Address:",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Center(
                    child: const Text(
                        "Flat no 551 , \nOm Shanti complex ,\nAndheri East, Mumbai"))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Blood Group:",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30),
                Text("O+"),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Expanded(child: Container()),
            GreenButton(
                text: "Emergency Call",
                height: 40,
                onp: () {},
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
