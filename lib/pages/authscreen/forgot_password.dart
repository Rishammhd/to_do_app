import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              "Forgot Password",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Username | Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
              ),
              child: Text("CONFIRM", style: TextStyle(color: Colors.white)),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
