import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authenticationmethods authenticationmethods = Authenticationmethods();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
                  Container(
                      padding: EdgeInsets.all(25),
                      height: screenSize.height * 0.6,
                      width: screenSize.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign-in",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 33),
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
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.6, color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () {},
                            ),
                          )
                        ],
                      )),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "New to Amazon?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      ))
                    ],
                  ),
                  CustomMainButton(
                    child: Text(
                      "create an Amazon Account",
                      style: TextStyle(letterSpacing: 0.6, color: Colors.black),
                    ),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ));
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
