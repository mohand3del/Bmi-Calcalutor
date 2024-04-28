class ResultsModel {
  final double? weight;
  final double? height; // in meters
  final double? bmi; // calculated BMI value
  final DateTime? dateTime;
  final int? age;
  final String result;
  final String? id; // in years

  ResultsModel( {
    this.id,
    required this.result,
    this.bmi,
    this.weight,
    this.height,
    this.age,
    this.dateTime,
  }); // Calculate BMI during construction

  /// Calculates the Body Mass Index (BMI) based on weight and height.

  /// Converts the ResultsModel object to a dictionary representation.

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'height': height,
        'bmi': bmi,
        'dateTime': dateTime!.toIso8601String(),
        'age': age,
        'result': result,
        'id': id
      };

  /// Creates a ResultsModel object from a JSON dictionary.

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        weight: json['weight'] as double,
        height: json['height'] as double,
        age: json['age'] as int,
        dateTime: DateTime.parse(json['dateTime'] as String),
        bmi: json['bmi'] as double,
        result: json['result'] as String,
        id: json['id'] as String
      );
}
