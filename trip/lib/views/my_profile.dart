// ignore_for_file: use_super_parameters, prefer_const_constructors, body_might_complete_normally_nullable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip/controller/auth_controller.dart';
import 'package:trip/utils/app_colors.dart';
import 'package:trip/widgets/intro_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = authController.myUser.value.name ?? "";
    homeController.text = authController.myUser.value.hAddress ?? "";
    shopController.text = authController.myUser.value.mallAddress ?? "";
    businessController.text = authController.myUser.value.bAddress ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.4,
            child: Stack(
              children: [
                introWidgetWithoutlogos(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null
                          ? Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffD6D6D6)),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(selectedImage!)),
                                  shape: BoxShape.circle,
                                  color: Color(0xffD6D6D6)),
                            )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                          'First Name', Icons.person_outlined, nameController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'First name is required!';
                        }
                        if (input.length < 5) {
                          return 'Please enter a valid name!';
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Last name', Icons.home_outlined, homeController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'Last name is required!';
                        }

                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Home Address',
                          Icons.card_travel_outlined,
                          businessController, (String? input) {
                        if (input!.isEmpty) {
                          return 'Home Address is required!';
                        }

                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget('Province', Icons.shopping_cart_outlined,
                          shopController, (String? input) {
                        if (input!.isEmpty) {
                          return 'Province Address is required!';
                        }

                        return null;
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() => authController.isProfileUploading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : buttonSubmit('Update', () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }

                              authController.isProfileUploading(true);
                              authController.storeUserInfo(
                                  selectedImage,
                                  nameController.text,
                                  homeController.text,
                                  businessController.text,
                                  shopController.text,
                                  url: authController.myUser.value.image ?? "");
                            })),
                    ],
                  )))
        ],
      ),
    ));
  }
}

// ignore: non_constant_identifier_names
TextFieldWidget(String title, IconData iconData,
    TextEditingController controller, Function validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7),
          )),
      const SizedBox(
        height: 6,
      ),
      Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
              validator: (input) => validator(input),
              controller: controller,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7),
              ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    iconData,
                    color: AppColors.greenColor,
                  ),
                ),
                border: InputBorder.none,
              ))),
    ],
  );
}

Widget buttonSubmit(String title, Function onPressed) {
  return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.greenColor,
      onPressed: () => onPressed(),
      child: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)));
}
