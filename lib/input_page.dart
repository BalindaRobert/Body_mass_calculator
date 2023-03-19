import 'package:body_mass_calculator/results.dart';
import 'package:flutter/material.dart';
import 'cardProperty.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'package:body_mass_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 200;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(children: [
          Expanded(
            child: ResuableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: CardProperty(
                sex: Icons.male,
                text: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: ResuableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              colour: selectedGender == Gender.female
                  ? activeCardColor
                  : inactiveCardColor,
              cardChild: CardProperty(
                sex: Icons.female,
                text: 'FEMALE',
              ),
            ),
          ),
        ])),
        Expanded(
            child: ResuableCard(
          colour: activeCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT',
                  style: TextStyle(
                      color: Color(
                        0xFF8D8E98,
                      ),
                      fontSize: 18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: numbers,
                  ),
                  SizedBox(width: 3),
                  Text('cm',
                      style: TextStyle(
                          color: Color(
                            0xFF8D8E98,
                          ),
                          fontSize: 18))
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.pink,
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                  overlayColor: Color(0x60EB1555),
                  trackHeight: 1,
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 300,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  inactiveColor: Color(0xFF8D8E98),
                ),
              )
            ],
          ),
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ResuableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                            style: TextStyle(
                                color: Color(
                                  0xFF8D8E98,
                                ),
                                fontSize: 18)),
                        Text(
                          weight.toString(),
                          style: numbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              child: Icon(
                                Icons.exposure_minus_1,
                                color: Colors.white,
                                size: 35,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 35),
                                backgroundColor: Color(0xFF4C4F5E))
                          ],
                        )
                      ],
                    ))),
            Expanded(
                child: ResuableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                            style: TextStyle(
                                color: Color(
                                  0xFF8D8E98,
                                ),
                                fontSize: 18)),
                        Text(
                          age.toString(),
                          style: numbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.exposure_minus_1,
                                color: Colors.white,
                                size: 35,
                              ),
                              backgroundColor: Color(0xFF4C4F5E),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 35),
                                backgroundColor: Color(0xFF4C4F5E))
                          ],
                        )
                      ],
                    ))),
          ],
        )),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(weight: weight, height: height);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Results(
                        result: calc.bmiCalculation(),
                        bmiInterpretation: calc.bmiInterpretation(),
                        bmiResult: calc.bmiResult())));
          },
          child: Container(
            child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 18, color: Colors.white))),
            margin: EdgeInsets.only(top: 10),
            color: bottomColor,
            width: double.infinity,
            height: bottomHeight,
          ),
        )
      ]),
    );
  }
}
