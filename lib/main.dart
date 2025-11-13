import 'package:flutter/material.dart';
import 'package:to_do_app/pages/homescreen.dart';
import 'package:to_do_app/pages/loginscreen.dart';
import 'package:to_do_app/pages/signup.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      // home: Loginscreen(),
      initialRoute: "/",
      routes: {
        '/': (context) => Loginscreen(),
        "/loginscreen": (context) => Loginscreen(),
        "/homescreen": (context) => Homescreen(),
        "/signup": (context) => Signup(),
      },
    );
  }
}
