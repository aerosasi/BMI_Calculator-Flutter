import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../components/constants.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

Gender
    selectedGender; //using this we are going to toggle the male / female boxes

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            ' cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  //weight card
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // age card
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResults: calc.calculateBMI(),
                              resultText: calc.getResults(),
                              resultInterpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}
