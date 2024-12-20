// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/utils/app_constants.dart';
import 'package:trip/views/otp_verification_screen.dart';
import 'package:trip/widgets/pinput_widget.dart';
import 'package:trip/widgets/text_widget.dart';

Widget otpverificationwidget() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(text: AppConstants.phoneVerification),
          textWidget(
              text: AppConstants.enterOtp,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 40,
          ),
         
Container(
width: Get.width,
height: 50,

  child: RoundedWithShadow()),

          const SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: AppConstants.resendCode + " ",
                      ),
                      TextSpan(
                          text: "10 seconds",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                   
                    ]),
              ))
        ],
      ));
}
