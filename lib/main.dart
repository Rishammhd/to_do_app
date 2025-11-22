import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/auth/ui/forgot_password.dart';
import 'package:to_do_app/pages/home/homescreen.dart';
import 'package:to_do_app/auth/ui/loginscreen.dart';
import 'package:to_do_app/auth/ui/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("flutter initialized");
  } catch (e) {
    print(e);
  }

  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      routes: {
        '/': (context) => Homescreen(),
        "/loginscreen": (context) => Loginscreen(),
        "/homescreen": (context) => Homescreen(),
        "/signup": (context) => Signup(),
        "/forgot": (context) => ForgotPassword(),
      },
    );
  }
}
