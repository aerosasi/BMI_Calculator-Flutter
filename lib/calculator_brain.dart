import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
     _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>25){
      return 'overweight';
    }else if(_bmi >18.5){
      return 'Normal';
    }else {
      return 'underweight';
    }
  }

  String getInterpretation(){

    if(_bmi>=25){
      return 'You are heigher than normal body weight.Try to exercise more.';
    }else if(_bmi >18.5){
      return 'You have a normal body.Good Job! ';
    }else {
      return 'You have a lower than a normal body weight. You can eat a bit more.';
    }

  }

}