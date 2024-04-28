import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBottom extends StatelessWidget {
  const AuthBottom(
      {super.key, required this.text, this.validator, required this.onPressed});
  final String text;
  final Function(String?)? validator;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 347.w,
      height: 48.h,
      child: MaterialButton(
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        padding: EdgeInsets.only(right: 50.h, left: 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
