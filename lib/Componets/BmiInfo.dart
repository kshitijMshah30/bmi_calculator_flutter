import 'package:flutter/material.dart';

class BmiInfo {
  BmiInfo({required this.bmi, required this.age, required this.gender});

  final double bmi;
  final int age;
  final String gender;

  String bimToString() {
    return bmi.toStringAsFixed(2);
  }

  String classifyBMI() {
    if (gender == 'male') {
      if (age < 18) {
        if (bmi < 18.5) {
          return 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          return 'Normal';
        } else if (bmi >= 24.9 && bmi < 29.9) {
          return 'Overweight';
        } else {
          return 'Obese';
        }
      } else {
        if (bmi < 18.5) {
          return 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          return 'Normal';
        } else if (bmi >= 24.9 && bmi < 29.9) {
          return 'Overweight';
        } else {
          return 'Obese';
        }
      }
    } else if (gender == 'female') {
      if (age < 18) {
        if (bmi < 18.5) {
          return 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          return 'Normal';
        } else if (bmi >= 24.9 && bmi < 29.9) {
          return 'Overweight';
        } else {
          return 'Obese';
        }
      } else {
        if (bmi < 18.5) {
          return 'Underweight';
        } else if (bmi >= 18.5 && bmi < 24.9) {
          return 'Normal';
        } else if (bmi >= 24.9 && bmi < 29.9) {
          return 'Overweight';
        } else {
          return 'Obese';
        }
      }
    } else {
      return 'Invalid gender';
    }
  }

  String getMessage(String classification) {
    String result;
    String action;

    switch (classification) {
      case 'Underweight':
        result = 'Your BMI result is quite low';
        action = 'you should eat more!';
        break;
      case 'Normal':
        result = 'Your BMI result is within the normal range';
        action = 'keep up the good work!';
        break;
      case 'Overweight':
        result = 'Your BMI result indicates that you are overweight';
        action = 'you might consider adopting a healthier lifestyle.';
        break;
      case 'Obese':
        result = 'Your BMI result indicates that you are obese';
        action = 'Please consult a healthcare professional.';
        break;
      default:
        result = 'Invalid classification';
        action = 'please check the classification.';
    }

    return '$result, $action';
  }

  Color getColor(String classification) {
    switch (classification) {
      case 'Underweight':
        return Color(0xFF00FF00); // Green
      case 'Normal':
        return Color(0xFF7FFF00); // Chartreuse
      case 'Overweight':
        return Color(0xFFFFFF00); // Yellow
      case 'Obese':
        return Color(0xFFFF4500); // Orange Red
      default:
        return Color(
            0xFF000000); // Black (Default color for invalid classification)
    }
  }
}
