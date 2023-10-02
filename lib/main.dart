import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyword_planner/core/util/app_theme.dart';
import 'package:keyword_planner/locator.dart';
import 'package:keyword_planner/presentation/view/home_screen.dart';

import 'data/remoute_data_source/base_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ByteData data =
  //     await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());
  // HttpOverrides.global = MyHttpOverrides();
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Keyword Suggestion',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
