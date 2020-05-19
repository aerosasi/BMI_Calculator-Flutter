import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/reusable_card.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResults,@required this.resultText,@required this.resultInterpretation});

  final String bmiResults;
  final String resultText;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResults.toUpperCase(),
                    style: kBmiTextStyle,
                  ),
                  Text(
                    resultInterpretation.toUpperCase(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RECALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
