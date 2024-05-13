// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth_tutorial_app/Widgets/Lable_Text.dart';
import 'package:local_auth_tutorial_app/Widgets/Rouned_boutton.dart';
import 'package:local_auth_tutorial_app/Widgets/TextComponent.dart';
import 'package:local_auth_tutorial_app/constant/App_color.dart';
import 'package:local_auth_tutorial_app/pages/ElectionVotepage.dart';
import 'package:local_auth_tutorial_app/pages/home_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _passwordVisible = true;
  String token = "";
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContrller = TextEditingController();
  AutovalidateMode switched = AutovalidateMode.disabled;
  final _EmailformKey = GlobalKey<FormState>();
  final _UserNAMEformKey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UpperSection(),
              Expanded(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.cardcolor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: TextComponent(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontsize: 24,
                                text:
                                    'ඔබගේ හැඳුනුම් අංකය සහ ඇඟිලි සලකුණ ඇතුළත් කරන්න \n Enter your ID number and fingerprint ',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            lableField(
                              " හැඳුනුම් අංකය / ID number ",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Form(
                              key: _EmailformKey,
                              autovalidateMode: switched,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.name,
                                focusNode: emailFocusNode,
                                style: const TextStyle(
                                  fontFamily: 'inter',
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontFamily: 'inter',
                                    fontSize: 14,
                                    color: Color(0xFFBCBCBC),
                                  ),
                                  hintText:
                                      " ඔබගේ හැඳුනුම් අංකය / Your ID number",
                                  filled: true,
                                  fillColor: AppColors.secondaryColor,
                                  contentPadding: EdgeInsets.all(11.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .grey, // Add your desired border color here
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'හැඳුනුම්පත අංකය අවශ්‍ය වේ \n ID number is required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : SizedBox(
                                      width: 180,
                                      height: 50,
                                      child: RoundedButton(
                                          color: AppColors.drivercardactive,
                                          buttonText: "Login",
                                          onPress: () async {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                    Id: emailController.text,
                                                  ),
                                                ));
                                          }),
                                    ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => SignIn(),
                                //     ));
                              },
                              child: Center(
                                child: TextComponent(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 15,
                                  text: 'Create Account',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppColors
                  .primaryColor, // Change the color to the desired background color
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextComponent(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600,
                        fontsize: 40,
                        text: 'අනන්‍යතාව තහවුරු කරගැනීම ',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: TextComponent(
                        color: AppColors.drivercardnotactive,
                        fontWeight: FontWeight.w500,
                        fontsize: 18,
                        text: "Identity verification",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
