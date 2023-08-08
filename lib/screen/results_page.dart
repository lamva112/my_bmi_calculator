import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_bmi_calculator/component/Bottom_Button.dart';
import 'package:my_bmi_calculator/component/resusable_card.dart';
import 'package:my_bmi_calculator/constants/app_styles.dart';
import 'package:my_bmi_calculator/model/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsPage extends StatelessWidget {
  final BMIResult? bmiResult;

  const ResultsPage({super.key, this.bmiResult});

  Future<void> onSavedPressed(String bmi, String status, int statusColor) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> saveList = prefs.getStringList('saveList') ?? [];

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(now);

      saveList.add(
        '{"bmi":"$bmi","status":"$status","statusColor":"$statusColor","formattedDate":"$formattedDate"',
      );

      await prefs.setStringList('saveList', saveList);
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              if(bmiResult != null){
                onSavedPressed(
                  bmiResult!.resultBMIScore,
                  bmiResult!.resultText,
                  bmiResult!.resultColor.value,
                );
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult?.resultText.toUpperCase() ?? "",
                    style: kResultTextStyle.copyWith(color: bmiResult?.resultColor),
                  ),
                  Text(
                    bmiResult?.resultBMIScore ?? "",
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiResult?.resultInterpretation ?? "",
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
