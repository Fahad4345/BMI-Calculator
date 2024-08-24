import 'package:flutter/material.dart';

import 'package:myapp/BMI/bmi_calculator.dart';
import 'package:myapp/BMI/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => BMIProvider(),
      )
    ],child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    )
    );
     
  }
}
