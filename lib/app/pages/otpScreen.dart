import 'dart:developer';

import 'package:flutter/material.dart';
import '../constant/export.dart';

class OtpScreen extends StatefulWidget {
  String Verificationid;
  OtpScreen({super.key, required this.Verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              pastedTextStyle: const TextStyle(
                color: Colors.green,
              ),
              length: 6,
            ),
          ),
          10.h,
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credetial =
                      PhoneAuthProvider.credential(
                          verificationId: widget.Verificationid,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credetial).then((Value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
                  },);
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: const Text("Check OTP"))
        ],
      ),
    );
  }
}
