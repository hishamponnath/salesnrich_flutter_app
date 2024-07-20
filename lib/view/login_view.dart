import 'package:flutter/material.dart';
import 'package:salesnrich_app_flutter/service/auth_service.dart';
import 'package:salesnrich_app_flutter/view/home_view.dart';

class LoginScreen extends StatefulWidget {
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const LoginScreen({super.key, required this.onThemeModeChanged});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                          controller: _usernamecontroller,
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
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a valid Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Color.fromARGB(255, 80, 123, 216),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.black),
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
                        onPressed: () async {
                          if (_loginKey.currentState!.validate()) {
                            AuthService authService = AuthService();
                            final user = await authService.login(
                                _usernamecontroller.text,
                                _passwordcontroller.text);
                            if (user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                          user: user,
                                          onThemeModeChanged:
                                              widget.onThemeModeChanged)),
                                  (route) => false);
                            } else {
                              _showSnackbar('Invalid username or password');
                            }
                          }
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
