import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _showpassword = true;
  bool _acceptterms = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 20),

                  child: Text(
                    "SignUp",
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
                      controller: _username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username or email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Username | Email adress "),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // paswword
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      obscureText: _showpassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showpassword = !_showpassword;
                            });
                          },
                          icon: Icon(
                            _showpassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // RE ENTER PASSWORD
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _repassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the password";
                        } else if (value != _password.text) {
                          return "Password didnt match";
                        }
                        return null;
                      },
                      obscureText: _showpassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Re Enter your password",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptterms,
                      onChanged: (value) {
                        setState(() {
                          _acceptterms = value!;
                        });
                      },
                    ),

                    const Text(
                      "I accept the Terms of Service\n and Privacy Policy",
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // SIGNUP Button
                Center(
                  child: Opacity(
                    opacity: _acceptterms ? 1.0 : 0.4,
                    child: ElevatedButton(
                      onPressed: _acceptterms
                          ? () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/homescreen",
                                  (route) => false,
                                );
                              }
                            }
                          : null,

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
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //LOGIN NAVIGATION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/loginscreen",
                          (route) => false,
                        );
                      },

                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
