import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  GreenButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.onp,
      required this.width})
      : super(key: key);

  String text;
  VoidCallback onp;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onp,
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff133A3A))),
      ),
    );
  }
}
