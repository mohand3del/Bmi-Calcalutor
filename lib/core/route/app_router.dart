import 'package:bim_calculator/core/route/routes.dart';
import 'package:bim_calculator/features/auth/sign_in/view/sign_in_screen.dart';
import 'package:bim_calculator/features/calculator/view/screen/result_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/sign_up/view/screen/sign_up_screen.dart';
import '../../features/calculator/view/screen/calculator_screen.dart';
import '../../features/calculator/view/screen/edit_result.dart';
import '../../features/calculator/view/screen/list_of_result.dart';



class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.calculator:
        return MaterialPageRoute(builder: (context) => CalculatorScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.result:
        return MaterialPageRoute(builder: (context) => ResultScreen(
          resultText: arguments.toString() ,
          bmiResult: arguments.toString(),
        ));
      case Routes.listResult:
        return MaterialPageRoute(builder: (context) => const ListOfResult());
      case Routes.editResult:
        return MaterialPageRoute(builder: (context) {
          return EditResultScreen(resultId: arguments as String);
        });
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No path for ${settings.name}'),
                  ),
                ));
    }
  }
}
