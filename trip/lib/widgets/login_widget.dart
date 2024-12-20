// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/utils/app_constants.dart';
import 'package:trip/views/otp_verification_screen.dart';
import 'package:trip/widgets/text_widget.dart';

Widget loginWidget(
    CountryCode countryCode, Function onCountryChange, Function onSubmit) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(text: AppConstants.helloNiceToMeetYou),
          textWidget(
              text: AppConstants.getMovingWithRozTrip,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 3,
                    blurRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => onCountryChange(),
                      child: Container(
                        child: Row(
                          children: [
                            const SizedBox(width: 5),

                            Expanded(
                              child: Container(
                                child: countryCode.flagImage,
                              ),
                            ),
                            textWidget(text: countryCode.dialCode),
                            // const SizedBox(width:10),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    )),
                Container(
                  width: 1,
                  height: 55,
                  color: Colors.black.withOpacity(0.2),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      onSubmitted: (String? input) => onSubmit(input),
                      decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          hintText: AppConstants.enterMobileNumber,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: AppConstants.byCreating + " ",
                      ),
                      TextSpan(
                          text: AppConstants.termsOfService + " ",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      TextSpan(text: "And "),
                      TextSpan(
                          text: AppConstants.privacyPolicy + " ",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    ]),
              ))
        ],
      ));
}
