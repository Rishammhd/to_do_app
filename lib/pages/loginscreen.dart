import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(left: 20),

                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // username
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // paswword
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Login Button
              Center(
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No account ?"),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
