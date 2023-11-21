
import 'package:chatapp/constant.dart';
import 'package:chatapp/core/widgets/custom_icon_buttons.dart';
import 'package:chatapp/features/login/login_page.dart';
import 'package:chatapp/features/sign_up/SignUpPage.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  static String id = 'initialroutes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Icon(
              Icons.textsms,
              size: 135,
              color: Colors.deepPurple[900],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Chatter',
              style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontFamily: 'Poppins',
                  fontSize: 29,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'World\'s most private chatting app'.toUpperCase(),
              style:const TextStyle(
                color: Color.fromARGB(255, 122, 80, 196),
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 155,
            ),
            CustomIconButtons(
              text: 'LOGIN',
              mainColor: Colors.white,
              textColor: kprimaryColor,
              onpress: () {
                Navigator.pushNamed(context, Loginpage.id);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomIconButtons(
                onpress: () {
                  Navigator.pushNamed(context, SignUpPage.id);
                },
                text: 'SIGNUP',
                mainColor: kprimaryColor,
                textColor: Colors.white),
            const Spacer(
              flex: 2,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
