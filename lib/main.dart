import 'package:flutter/material.dart';
import 'package:paymob/core/network/dio_helper.dart';
import 'package:paymob/modules/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const Scaffold(
        body: RegisterScreen(),
      ),
    );
  }
}
