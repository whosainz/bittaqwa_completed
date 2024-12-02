import 'package:bittaqwa_update/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Membuat sebuah controller unutk menambah titik2
  final MoneyMaskedTextController moneyController = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );

// membuat variable awal unutk toal harta dan zakat
  double totalHarta = 0;

  double zakatDikeluarkan = 0;

  double minimumHarta = 8500000;

//membuat variable untuk menampung format dari variable awal
  String formattedHarta = "";

  String formattedZakatDikeluarkan = "";

// Membuat funtion untuk menghitung zakat
  void HitungZakat() {
    // ambil inputan dari controller dan hilangkan titik
    String cleanValue = moneyController.text.replaceAll(".", "");
    // parsig dari string ke double
    double inputValue = double.tryParse(cleanValue) ?? 0;
    // Mmebuat sebuah pengkondisian jika harta kita sama atau lebih dari minimumharta
    if (inputValue >= minimumHarta) {
      // jika inputan lebih dari minimumharta kita akan ubah value nya
      setState(() {
        totalHarta = inputValue;
        zakatDikeluarkan = (inputValue * 2.5) / 100;

      //kita ubah menjadi format rupiah'
      formattedHarta = NumberFormat.currency(locale: "id_ID", symbol: '')
      .format(totalHarta);
      formattedZakatDikeluarkan = NumberFormat.currency(locale: "id_ID", symbol: '')
      .format(zakatDikeluarkan);
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("PERINGATAN"),
          content: Text("Harta anda tidak mencapai 85jt"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))
          ],  
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget CardHarta() {
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: ColorApp.grey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Harta",
              style: TextStyle(
                  fontFamily: "PoppinsMedium", color: ColorApp.primary),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: moneyController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorApp.primary)),
                  label: Text("Masukkan Total Harta"),
                  labelStyle: TextStyle(color: ColorApp.text),
                  prefix: Text("Rp. "),
                  fillColor: ColorApp.white,
                  filled: true),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(double.infinity, 0),
                  padding: EdgeInsets.all(16)),
              onPressed: () {
                HitungZakat();
              },
              child: Text(
                "OK",
                style: TextStyle(color: ColorApp.white),
              ),
            ),
          ],
        ),
      );
    }

    Widget CardResult() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red[300]!,
            ),
            child: Column(
              children: [
                Text(
                  "Total Uang",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Rp. ${formattedHarta}",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple[300]!,
            ),
            child: Column(
              children: [
                Text(
                  "Zakat Dikeluarkan",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Rp. ${formattedZakatDikeluarkan}",
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    color: ColorApp.white,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(

      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Kalkulator Zakat",
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
      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
}
