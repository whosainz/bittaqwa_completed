import 'package:bittaqwa_update/presentation/screens/dashboard.dart';
import 'package:bittaqwa_update/presentation/screens/doa_screen.dart';
import 'package:bittaqwa_update/presentation/screens/jadwal_sholat_screen.dart';
import 'package:bittaqwa_update/presentation/screens/video_kajian_screen.dart';
import 'package:bittaqwa_update/presentation/screens/zakat_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(MyApp());
}
        
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Dashboard(),
        '/doa': (context) => DoaScreen(),
        '/zakat': (context) => ZakatScreen(),
        '/jadwal-sholat': (context) => JadwalSholatScreen(),
        '/video-kajian': (context) => VideoKajianScreen(),
      },
    );
  }
}
