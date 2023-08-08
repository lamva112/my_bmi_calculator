import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/result.dart';
import 'package:my_bmi_calculator/screen/history_page.dart';
import 'package:my_bmi_calculator/screen/input_screen.dart';
import 'package:my_bmi_calculator/screen/results_page.dart';
import 'package:my_bmi_calculator/screen/splash_screen.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen(),
        );
      case splash:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case resultPage:
          BMIResult result = args as BMIResult;
        return MaterialPageRoute<ResultsPage>(
          builder: (_) => ResultsPage(bmiResult: result,),
        );
      case inputPage:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const InputScreen(),
        );
      case historyPage:
        return MaterialPageRoute<InputScreen>(
          builder: (_) => const HistoryPage(),
        );
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';
  static const splash = 'splash';
  static const inputPage = 'input';
  static const resultPage = 'result';
  static const historyPage = 'history';
}

class RouteException implements Exception{
  final String message;
  const RouteException(this.message);
}