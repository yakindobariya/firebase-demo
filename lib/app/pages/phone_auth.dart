import 'package:firebasedemo/app/pages/otpScreen.dart';
import 'package:flutter/material.dart';

import '../constant/export.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstATop),
            child: Image(
              image: const NetworkImage(
                  "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg"),
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Your Number",
                    style: GoogleFonts.abel(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8.0),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: "phone number",
                          suffixIcon: Icon(Icons.phone)),
                    ),
                  ),
                  10.h,
                  ElevatedButton(
                      onPressed: () async {
                        try{
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+91${phoneController.text.toString()}",
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException ex) {},
                              codeSent: (String verificationid, int? resendtoken) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpScreen(Verificationid: verificationid,),
                                    ));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},);
                        }catch(e){
                          print("Error:-$e");
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
