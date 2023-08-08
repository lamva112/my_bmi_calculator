
import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_colors.dart';
import 'package:my_bmi_calculator/routes/routes.dart';
import 'package:my_bmi_calculator/screen/splash_screen.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.appPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appPrimaryColor,
        ),
        scaffoldBackgroundColor: AppColors.appPrimaryColor,
      ),
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: SplashScreen(),
    );
  }
}
