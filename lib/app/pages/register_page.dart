import 'package:firebasedemo/app/pages/verification_page.dart';
import 'package:flutter/material.dart';
import '../constant/export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        elevation: 5,
      ),
      body: Stack(
        children: [
          // Opacity(opacity: 0.8, child: Image.asset("images/background.jpg")),
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
                  color: Colors.white.withOpacity(.7),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Lottie.asset('images/authLottie.json',
                              height: 200, width: 200),
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
                                hintText: "Email"),
                          ),
                          10.h,
                          TextFormField(
                            controller: passwordController,
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
                                hintText: "Password"),
                          ),
                          10.h,
                          MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  bool? res = await firebaseService
                                      .registerWithEmailOrPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                  if (res ?? false) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const VerificationPage() // Navigate to the new splash page
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Error"),
                                        backgroundColor: Colors.redAccent,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  print("Error:- $e");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Error: ${e.toString()}"),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              }
                            },
                            elevation: 0,
                            color: Colors.deepPurpleAccent.withOpacity(.5),
                            child: const Text("Register"),
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
