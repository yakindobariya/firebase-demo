import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constant/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 5,
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Adjust the opacity value
              BlendMode.dstATop,
            ),
            child: Image.asset("images/background.jpg",height: MediaQuery.of(context).size.height,fit: BoxFit.fitHeight,),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Lottie Animation
                          Lottie.asset(
                            'images/authLottie.json',
                            height: 200,
                            width: 200,
                          ),
                          10.h,

                          // Email Field
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                          ),
                          10.h,
                          // Password Field
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password",
                            ),
                          ),
                          10.h,
                          // Login Button
                          MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                // Navigate to the RegisterPage using CustomNavigator
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Success"),
                                ));
                              }
                            },
                            elevation: 0,
                            color: Colors.deepPurpleAccent.withOpacity(.5),
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
