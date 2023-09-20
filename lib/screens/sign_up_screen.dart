import 'dart:math';

import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../resources/authentication_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authenticationmethods authenticationmethods = Authenticationmethods();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    adressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                          padding: EdgeInsets.all(25),
                          height: screenSize.height * 0.85,
                          width: screenSize.width * 0.8,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 33),
                              ),
                              TextFieldWidget(
                                title: "E-mail",
                                controller: nameController,
                                obscureText: false,
                                hintText: 'Enter your Name',
                              ),
                              TextFieldWidget(
                                title: "Adress",
                                controller: adressController,
                                obscureText: false,
                                hintText: 'Enter your Adress',
                              ),
                              TextFieldWidget(
                                title: "E-mail",
                                controller: emailController,
                                obscureText: false,
                                hintText: 'Enter your E-mail',
                              ),
                              TextFieldWidget(
                                title: "Password",
                                controller: passwordController,
                                obscureText: true,
                                hintText: 'Enter your Password',
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomMainButton(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        letterSpacing: 0.6,
                                        color: Colors.black),
                                  ),
                                  color: yellowColor,
                                  isLoading: false,
                                  onPressed: () async {
                                    String output =
                                        await authenticationmethods.signUpUser(
                                            name: nameController.text,
                                            adress: adressController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                    if (output == "success") {
                                      log("doing next step" as num);
                                    } else {
                                      log(output as num);
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  CustomMainButton(
                    child: Text(
                      "Back",
                      style: TextStyle(letterSpacing: 0.6, color: Colors.black),
                    ),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
