import 'package:flutter/material.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset("image/salesnrich.png"),
              const Text(
                "SalesNrich",
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 213, 211, 211),
                    borderRadius: BorderRadius.circular(20)),
                height: 320,
                width: 300,
                child: Form(
                  key: _loginKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a valid User Name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "User Name",
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Color.fromARGB(255, 80, 123, 216),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.black), // Default border color
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a valid Password";
                            }
                            return null;
                          },
                          obscureText:
                              true, // This makes the TextFormField a password field
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Color.fromARGB(255, 80, 123, 216),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.black), // Default border color
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 240, 116, 14),
                          side: const BorderSide(color: Colors.black),
                          minimumSize: const Size(150, 40),
                        ),
                        onPressed: () {
                          if (_loginKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
