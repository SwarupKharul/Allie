import 'package:flutter/material.dart';

Widget myNav(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 200.0),
    child: Row(
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "allie",
            )),
        Expanded(child: SizedBox()),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
              elevation: 0,
              dropdownColor: Color(0xffF6F6EE),
              value: 0,
              items: const [
                DropdownMenuItem(
                  child: Text("Funds"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("Synths"),
                  value: 1,
                ),
                DropdownMenuItem(child: Text("NFTs"), value: 2)
              ],
              onChanged: (value) {
                print(value);
              }),
        ),
        SizedBox(
          width: 40,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              isExpanded: false,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
              elevation: 0,
              dropdownColor: Color(0xffF6F6EE),
              value: 0,
              items: const [
                DropdownMenuItem(
                  child: Text("Utilities"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("Reminder"),
                  value: 1,
                ),
                DropdownMenuItem(child: Text("Memories"), value: 2)
              ],
              onChanged: (value) {
                print(value);
              }),
        ),
        SizedBox(
          width: 40,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
              elevation: 0,
              dropdownColor: Color(0xffF6F6EE),
              value: 0,
              items: const [
                DropdownMenuItem(
                  child: Text("Reports"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("Report 1"),
                  value: 1,
                ),
                DropdownMenuItem(child: Text("Report 2"), value: 2)
              ],
              onChanged: (value) {
                print(value);
              }),
        ),
        SizedBox(
          width: 40,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
              elevation: 0,
              dropdownColor: Color(0xffF6F6EE),
              value: 0,
              items: const [
                DropdownMenuItem(
                  child: Text("Progress"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("Clock Test"),
                  value: 1,
                ),
                DropdownMenuItem(child: Text("Audio Test"), value: 2)
              ],
              onChanged: (value) {
                print(value);
              }),
        )
      ],
    ),
  );
}
