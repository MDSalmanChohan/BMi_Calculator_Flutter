import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'BMI Calculator',
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiCategory = '';

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    double heightInMeters = height / 100; // Convert height from cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);
    setState(() {
      bmiResult = bmi;
      bmiCategory = getBMICategory(bmi);
    });
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal Weight';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 32.0),
            Text(
              'BMI: ${bmiResult.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'Category: $bmiCategory',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
