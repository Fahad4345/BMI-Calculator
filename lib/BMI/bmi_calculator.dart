import 'package:flutter/material.dart';
import 'package:myapp/BMI/provider.dart';
import 'package:provider/provider.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("BMI Calculator App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:context.read<BMIProvider>().heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (m)",
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white38,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox( height: 20,),
           TextField(
                controller:context.read<BMIProvider>().weightController,
             
              keyboardType: TextInputType.
              number,
              decoration: InputDecoration(
                labelText: "Weight (Kg)",
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white38,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ), 
              ),
            ),
            SizedBox( height: 20),
            ElevatedButton(onPressed: () => context.read<BMIProvider>().calculateBMI(),
             child: Text("Calculate BMI"),), 
                SizedBox( height: 20),
                Consumer<BMIProvider>(builder:(context,provider,child){
                  Color categoryColor = provider.bmiCategory == "You have a Underweight\n(BMI less then 18.5) " || provider.bmiCategory =="You have a Normal\n(BMI 18.5-24.9)"|| provider.bmiCategory =="You have a Overweight\n(BMI 25-30)" ?Colors.green : Colors.red;
                  return Column(
                    children: [
                  Text(
                    provider.bmi==0 
                    ? ''
                    : "Your BMI :${provider.bmi.toStringAsFixed(1)} Kg/m2",
                     style: const TextStyle(
                      fontSize: 25,
                       fontWeight: FontWeight.bold,
                       ),
                       ),
                  const SizedBox(height:10),
                  Text(provider.bmiCategory,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color: categoryColor,
                    fontWeight: FontWeight.bold ,
                    fontSize: 20,
                    ),
                    )
                  ],
                  );
                }
                )
          
          ],
        ),
      ),
    );
  }
}
