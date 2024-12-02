// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bittaqwa_update/utils/color.dart';

class Detaildoa extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String reference;
  const Detaildoa({
    Key? key,
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Doa-Doa",
          style: TextStyle(
            fontFamily: "PoppinsMedium",
            color: ColorApp.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: ColorApp.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_detail_doa.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorApp.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 2,

                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 20,
                      color: ColorApp.text),
                      textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  arabicText,
                  style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 24,
                      color: ColorApp.text),
                      textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  translation,
                  style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 16,
                      color: Colors.blue[200]
                      ),
                      textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  reference,
                  style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 15,
                      color: Colors.grey),
                      textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
