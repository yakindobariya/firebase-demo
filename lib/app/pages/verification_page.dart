import 'dart:async';

import 'package:flutter/material.dart';

import '../constant/export.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  FirebaseService firebaseService = FirebaseService();
Timer? verificationTimer;
  bool isChecked = false; // Email verification status

  @override
  void initState() {
    super.initState();
    verificationTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      firebaseService.checkEmailVerification(context, (status) {
        if (status) {
          // Stop the timer when verified
          timer.cancel();
        }
        setState(() {
          isChecked = status;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification Email"),
        elevation: 5,
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Adjust opacity
              BlendMode.dstATop,
            ),
            child: Image.asset(
              "images/background.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Lottie.network(
                            "https://lottie.host/3daba650-84cb-4bad-9c9c-93f3aae15c9a/tfYLghxyY6.json"),
                        Text(
                          isChecked
                              ? "Your email is verified!"
                              : "Please verify your email.",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isChecked ? Colors.green : Colors.orange),
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.network(
                              "https://lottie.host/2a151cff-a25e-47be-a157-573f3107e300/eyKsQbYtlI.json"),
                        ),
                      ],
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
