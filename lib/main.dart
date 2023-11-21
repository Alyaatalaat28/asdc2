import 'package:chatapp/features/chat/presentation/chatPage.dart';
import 'package:chatapp/features/initial_page/initialScreen.dart';
import 'package:chatapp/features/login/login_page.dart';
import 'package:chatapp/features/sign_up/SignUpPage.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class   ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Loginpage.id: (context) => const Loginpage(),
        InitialScreen.id: (context) => const InitialScreen(),
        SignUpPage.id: (context) => const SignUpPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: InitialScreen.id,
    );
  }
}
