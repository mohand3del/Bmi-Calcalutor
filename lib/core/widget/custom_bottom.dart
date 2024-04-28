import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({this.onTap, this.buttonTitle});

  final void Function()? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.lightBlueAccent,
        margin: EdgeInsets.only(top: 10.0.h),
        padding: EdgeInsets.only(bottom: 20.0.h),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle!,
            style: largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
