part of 'bmi_cubit.dart';


abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiCalculated extends BmiState {
  final double bmi;
  //final String gender;
  final double height;
  final double weight;
  final int age;

  BmiCalculated(this.bmi, this.height, this.weight, this.age);
}

class BmiError extends BmiState {
  final String errorMessage;

  BmiError(this.errorMessage);
}
