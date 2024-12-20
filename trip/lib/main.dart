// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trip/controller/auth_controller.dart';
//import 'package:trip/views/home_screen.dart';
//import 'package:trip/views/login_screen.dart';
//import 'package:trip/views/profile_settings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trip/firebase_options.dart';
//import 'package:trip/views/decision/decision_screen.dart';
import 'package:trip/views/driver/car_registration/car_registration_template.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    authController.decideRoute();

    final textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      home: CarRegistrationTemplate(),
    );
  }
}
