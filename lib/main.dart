import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedemo/app/pages/register_page.dart';
import 'package:firebasedemo/app/service/firebase_options.dart';
import 'package:flutter/material.dart';

import 'app/constant/export.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    );
  }
}
