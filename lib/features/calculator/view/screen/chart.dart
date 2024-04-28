import 'package:flutter/material.dart';

class BMIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Categories',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildBMIChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildBMIChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBMIItem('Underweight', 0, 18.5),
        _buildBMIItem('Normal weight', 18.5, 24.9),
        _buildBMIItem('Overweight', 25, 29.9),
        _buildBMIItem('Obesity Class I', 30, 34.9),
        _buildBMIItem('Obesity Class II', 35, 39.9),
        _buildBMIItem('Obesity Class III', 40, double.infinity),
      ],
    );
  }

  Widget _buildBMIItem(String category, double lowerLimit, double upperLimit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            category,
            style: TextStyle(fontSize: 18.0),
          ),
          Spacer(),
          Text(
            'BMI Range: ${lowerLimit.toStringAsFixed(1)} - ${upperLimit.isFinite ? upperLimit.toStringAsFixed(1) : "∞"}',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}