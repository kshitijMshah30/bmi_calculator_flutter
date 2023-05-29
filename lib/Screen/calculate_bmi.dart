import 'package:bmi_calculator/Componets/constants.dart';
import 'package:bmi_calculator/Screen/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Componets/resuableCard.dart';
import 'package:bmi_calculator/Componets/BmiInfo.dart';

//todo: Make the RE-Calculate button
//todo: Calculate the BMI

class CalculatePage extends StatelessWidget {
  CalculatePage({required this.bmi, required this.age, this.gender});

  final double bmi;
  final int age;
  final String? gender;

  @override
  Widget build(BuildContext context) {
    BmiInfo obj = new BmiInfo(bmi: bmi, age: age, gender: gender!);
    String classification = obj.classifyBMI();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kLargeTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              child: ResuableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      classification,
                      style: kResultTextStyle,
                    ),
                    Text(
                      obj.bimToString(),
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: obj.getColor(classification)),
                    ),
                    Text(
                      obj.getMessage(classification),
                      style: kAnalysisTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            bottonTitle: 'RE-CALCULATE BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
