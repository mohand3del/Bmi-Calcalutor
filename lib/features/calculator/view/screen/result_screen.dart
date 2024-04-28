import 'package:bim_calculator/core/constants/constants.dart';
import 'package:bim_calculator/core/widget/custom_bottom.dart';
import 'package:bim_calculator/core/widget/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/route/routes.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen( {
   required this.bmiResult,
    required this.resultText,
  });

  final String? bmiResult;
  final String? resultText;
  //final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText!.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: bmiTextStyle,
                  ),
                  // Text(
                  //   interpretation!,
                  //   textAlign: TextAlign.center,
                  //   style: bodyTextStyle,
                  // ),
                ],
              ),
            ),
          ),
          CustomBottom(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, Routes.calculator,(routes)=>false);
            },
          )
        ],
      ),
    );
  }
}
