import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Componets/resuableCard.dart';
import 'package:bmi_calculator/Componets/iconContent.dart';
import 'package:bmi_calculator/Componets/constants.dart';
import 'calculate_bmi.dart';

//todo: Make Screes and componte folders
//todo: Refact the code

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? genderSelected;
  int height = 180;
  int weight = 120;
  int age = 18;

  double calBMI() {
    return weight / (height / 100) / (height / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.male;
                        });
                      },
                      color: genderSelected == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        Icon(
                          FontAwesomeIcons.mars,
                          size: kIconSize,
                        ),
                        'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                      color: genderSelected == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        Icon(
                          FontAwesomeIcons.venus,
                          size: kIconSize,
                        ),
                        'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResuableCard(
                color: genderSelected == null
                    ? kInactiveCardColor
                    : kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kTextLableStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextLableStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        trackHeight: 1,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 20,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 40,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            if (genderSelected != null) {
                              height = newValue.round();
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      color: genderSelected == null
                          ? kInactiveCardColor
                          : kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kTextLableStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: kNumberStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: FontAwesomeIcons.plus,
                                onLongPress: () {
                                  if (genderSelected != null) age = age + 10;
                                },
                                onPressed: () {
                                  setState(() {
                                    if (genderSelected != null) age = age + 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (genderSelected != null)
                                      age = age < 2 ? 1 : age - 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      color: genderSelected == null
                          ? kInactiveCardColor
                          : kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kTextLableStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'kg',
                                style: kTextLableStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTickMarkColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              trackHeight: 1,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 10,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 20,
                              ),
                            ),
                            child: Slider(
                              value: weight.toDouble(),
                              min: 30,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  if (genderSelected != null) {
                                    weight = newValue.round();
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              bottonTitle: 'Calculate',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CalculatePage(
                      bmi: calBMI(),
                      age: age,
                      gender: genderSelected == Gender.male ? 'male' : 'female',
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.bottonTitle, @required this.onTap});

  final String? bottonTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColour,
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            bottonTitle!,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton({this.icon, this.onPressed, this.onLongPress});

  final IconData? icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  @override
  RawMaterialButton build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      disabledElevation: 10,
      onLongPress: onLongPress,
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Icon(icon),
    );
  }
}
