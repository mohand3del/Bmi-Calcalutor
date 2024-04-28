import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.color, this.cardChild, this.onTap});

  final Color? color;
  final Widget? cardChild;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
      ),
    );
  }
}
