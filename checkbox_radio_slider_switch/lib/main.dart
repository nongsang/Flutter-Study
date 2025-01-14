import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: TestScreen(),
      )
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<TestScreen> {
  bool? isChecked = true;
  String? selectedPlatform;
  double slideValue = 5.0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Checkbox Test'),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            Text('checkbox value is $isChecked'),
          ],
        ),

        Text('Radio Test'),
        Row(
          children: [
            Radio(
              value: 'android',
              groupValue: selectedPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectedPlatform = value;
                });
              },
            ),
            Text('android'),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'iOS',
              groupValue: selectedPlatform,
              onChanged: (String? value) {
                setState(() {
                  selectedPlatform = value;
                });
              },
            ),
            Text('iOS'),
          ],
        ),
        Text('selected platform is $selectedPlatform'),

        Text('Slider Test'),
        Slider(
          value: slideValue,
          min: 0.0,
          max: 10.0,
          onChanged: (double value) {
            setState(() {
              slideValue = value;
            });
          },
        ),
        Text('slider value is $slideValue'),

        Text('Switch Test'),
        Switch(
          value: isSelected,
          onChanged: (bool value) {
            setState(() {
              isSelected = value;
            });
          },
        ),
        Text('select value is $isSelected'),
      ],
    );
  }
}