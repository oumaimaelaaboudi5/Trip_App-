// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/views/otp_verification_screen.dart';
import 'package:trip/widgets/intro_widget.dart';
import 'package:trip/widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode countryCode =
      CountryCode(name: 'Morocco', code: "MA", dialCode: "+212");

  onSubmit(String? input) {
    Get.to(() => OtpVerificationScreen(countryCode.dialCode + input!));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: duplicate_ignore
      // ignore: prefer_const_constructors, sized_box_for_whitespace
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              introWidget(),
              const SizedBox(
                height: 50,
              ),
              loginWidget(countryCode, () async {
                final code = await countryPicker.showPicker(context: context);
                // Null check
                // ignore: empty_statements
                if (code != null) countryCode = code;
              }, onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
