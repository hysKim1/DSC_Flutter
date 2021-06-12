import 'package:bmi_calculator/Calculator.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

//enum
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  /* 삼항연산자로 대체
  Color maleCardColour = inactiveContColour;
  Color femaleCardColour=inactiveContColour;

  void updateColur(Gender selectedGender){
    if  (selectedGender==Gender.male){
      if (  maleCardColour == inactiveContColour){
      maleCardColour = activeContColour;
      femaleCardColour=inactiveContColour;
    } else {
      maleCardColour = activeContColour;
    }
  }
    if  (selectedGender==Gender.female){
      if (  femaleCardColour == inactiveContColour){
        femaleCardColour = activeContColour;
        maleCardColour=inactiveContColour;
      } else {
        femaleCardColour = activeContColour;
      }
    }

  */
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveContColour
                        : kInactiveContColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: '남'),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveContColour
                        : kInactiveContColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.venus, label: '여'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableContainer(
            colour: kActiveContColour,
            cardChild: Column(
              children: [
                Text('키', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text('cm', style: kNumberTextStyle)
                  ],
                ),
                SliderTheme(
                  //customizing
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555), //opaque
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ), //default null
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          //rebuilding for slider to update new value
                          height = newValue.round();
                        });
                      }),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(
                  colour: kActiveContColour,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('몸무게', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ]),
                      ]),
                ),
              ),
              Expanded(
                  child: ReusableContainer(
                colour: kActiveContColour,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('나이', style: kLabelTextStyle),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ]),
                    ]),
              )),
            ],
          )),
          BottomButton(
            buttonTitle: '계산하기',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              //Routing
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    //passing the data
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
