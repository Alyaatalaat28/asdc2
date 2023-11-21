// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/core/widgets/show_edge_alert_widget.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/core/widgets/custom_text_feild.dart';
import 'package:chatapp/core/widgets/custom_icon_buttons.dart';
import 'package:chatapp/features/chat/presentation/chatPage.dart';
import 'package:chatapp/features/sign_up/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  static String id = 'loginpage';

  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Icon(
                    Icons.textsms,
                    size: 135,
                    color: Colors.deepPurple[900],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Chatter',
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextFeild(
                    onchanged: (data) {
                      email = data;
                    },
                    text: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFeild(
                    onchanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    text: 'Password',
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  CustomIconButtons(
                      onpress: () async {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });

                          try {
                            Navigator.pushNamed(context, ChatPage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackbarWidget(context, 'user not found');
                            } else if (e.code == 'wrong-password') {
                              showSnackbarWidget(context, 'wrong password');
                            }
                          }
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      text: 'LOGIN',
                      mainColor: kprimaryColor,
                      textColor: Colors.white),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: Text(
                      'or create an account',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
