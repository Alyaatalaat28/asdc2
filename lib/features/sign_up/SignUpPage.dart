
// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/core/widgets/show_edge_alert_widget.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/core/widgets/custom_text_feild.dart';
import 'package:chatapp/core/widgets/custom_icon_buttons.dart';
import 'package:chatapp/features/chat/presentation/chatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'signup';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          backgroundColor: const Color.fromARGB(249, 255, 255, 255),
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
                      icon: Icons.email),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFeild(
                      onchanged: (data) {
                        password = data;
                       
                      },
                      obscureText: true,
                      text: 'Password',
                      icon: Icons.lock),
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
                            await signUpUser();
                            Navigator.pushNamed(context, ChatPage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackbarWidget(context, 'weak password');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackbarWidget(
                                  context, 'The account already exists');
                            }
                          } catch (e) {
                            showSnackbarWidget(
                                context, 'There was an error ');
                            if (kDebugMode) {
                              print(e);
                            }
                          }
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      text: 'SIGNUP',
                      mainColor: kprimaryColor,
                      textColor: Colors.white),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'aready have an account',
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

  Future<void> signUpUser() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
