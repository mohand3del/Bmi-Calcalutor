import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/model/results_model.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());
  double bmi = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> calculateBMI({
    required double height,
    required double weight,
    required int age,
  }) async {
    if (height <= 0 || weight <= 0) {
      emit(BmiError("Height and weight must be greater than zero"));
    }

    bmi = weight / pow(height / 100, 2);
    final String result = getResult();
    final DateTime now = DateTime.now();
    try {
      // Add data to Firestore using ResultsModel (consider using it)
      final resultsModel = ResultsModel(
          weight: weight,
          height: height,
          age: age,
          dateTime: now,
          bmi: bmi,
          result: result,
          id: DateTime.now().toString()
          // Pre-calculated BMI
          );
      await _firestore
          .collection('bmi_data')
          .doc(resultsModel.id)
          .set(resultsModel.toJson());
      emit(BmiCalculated(bmi, height, weight, age));
      return bmi.toStringAsFixed(1);
    } on FirebaseException catch (e) {
      emit(BmiError("Error adding data to Firestore: $e"));
      return Future.error("Error: $e");
    }
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
