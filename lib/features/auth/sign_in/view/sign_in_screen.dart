import 'package:bim_calculator/core/helper/app_regex.dart';
import 'package:bim_calculator/core/route/routes.dart';
import 'package:bim_calculator/core/widget/auth_bottom.dart';
import 'package:bim_calculator/core/widget/custom_text_field.dart';
import 'package:bim_calculator/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isPasswordObscureText = true;

  //late TextEditingController emailController;

  TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passwordController = context.read<AuthCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key:formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Text(
                      "Sign In Screen",
                      style: TextStyle(fontSize: 22.sp),
                    ),
                  ),
                  Image.asset(
                    'assets/images/Image (1).png',
                    height: 200.h,
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'please enter a valid email';
                      }
                    },
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: 18.sp,
                    ),
                    controller:emailController,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 18,
                    ),
                    isObscureText: isPasswordObscureText,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return 'please enter a valid password';
                      }
                    },
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordObscureText = !isPasswordObscureText;
                          });
                        },
                        child: Icon(
                          isPasswordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        )),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  AuthBottom(
                    text: 'Sign In',
                    onPressed: () async {
                      if (formKey
                          .currentState!
                          .validate()) {
                        context.read<AuthCubit>().login(
                            emailController.text,
                            passwordController.text);
                        Navigator.pushReplacementNamed(
                            context, Routes.calculator);
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AuthBottom(
                    text: 'Sign In Anonymously',
                    onPressed: () async {
                      context.read<AuthCubit>().signInAnonymously();
                      Navigator.pushNamedAndRemoveUntil(context, Routes.calculator, (route) => false);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: GestureDetector(
                      child: Text(
                        'register',
                        style: TextStyle(
                            color: Colors.lightBlueAccent, fontSize: 16.sp),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
