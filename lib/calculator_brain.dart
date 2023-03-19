import 'dart:core';
import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final int? weight;
  final int? height;
   double? _bmi;

  String bmiCalculation (){
     _bmi = (weight! / pow(height!/100, 2)) as double?;
    return _bmi!.toStringAsFixed(1);
  }
  String bmiResult (){
    if(_bmi! >= 25){
      return 'OVERWIGHT';
    }else if ( _bmi! >= 18){
      return 'NORMAL';
    }else {
      return 'UNDERWEIGHT';
    }
    }
    String bmiInterpretation () {
      if(_bmi! >= 25){
        return 'You are abnormal, please stop eating fatty foods and work our more.';
      }else if ( _bmi! >= 18){
        return 'Guess what!! Your have a normal body mass index.';
      }else {
        return 'Please try to eat well, try expensive foods enough with the posho and beans.';
      }



    }






}