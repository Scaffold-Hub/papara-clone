import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:papara/screens/profile_page.dart';
import 'package:papara/screens/splash_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const PaparaClone(),
    ),
  );
}

class PaparaClone extends StatelessWidget {
  const PaparaClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.pink,
      ),
      home: const SplashPage(),
    );
  }
}
