// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bittaqwa_update/data/doa_data.dart';
import 'package:bittaqwa_update/presentation/screens/detaildoa.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class DoaList extends StatelessWidget {
  final String category;

  const DoaList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> listDoa = getDoaList(category);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "List Doa",
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
      body: ListView.builder(
        itemCount: listDoa.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              top: 12,
              left: 15,
              right: 15,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: ColorApp.white),
            child: ListTile(
              leading: Image.asset(
                listDoa[index]['image']!,
              ),
              title: Text(
                listDoa[index]['title']!,
                style: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detaildoa(
                      title: listDoa[index]['title']!,
                      arabicText: listDoa[index]['arabicText']!,
                      translation: listDoa[index]['translation']!,
                      reference: listDoa[index]['reference']!,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
