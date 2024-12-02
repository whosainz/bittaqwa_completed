// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String time;
  final String name;

  const Time({
    Key? key,
    required this.time,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(fontFamily: "PoppinsRegular"),
        ),
        Spacer(),
        Text(
          time,
          style: TextStyle(fontFamily: "PoppinsRegular"),
        ),
        SizedBox(
          width: 16,
        ),
        Image.asset("assets/images/img_clock.png"),
      ],
    );
  }
}
