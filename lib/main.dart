import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_flutter/cal_bmi.dart';
import 'package:navigation_flutter/constants.dart';
import 'package:navigation_flutter/second_screen.dart';
import 'package:navigation_flutter/widgets.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: appBarColor,
        ),
        backgroundColor: scaffoldBackgroundColor,
        body: ScaffoldBody(),
      ),
    );
  }
}

class ScaffoldBody extends StatefulWidget {
  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  void updateGenderCardColor(Gender gender){
    maleCardColor = (gender == Gender.male) ? activeCardColor : inActiveCardColor;
    femaleCardColor = (gender == Gender.female) ?activeCardColor : inActiveCardColor;
  }

  Color femaleCardColor = inActiveCardColor;
  Color maleCardColor = inActiveCardColor;
  Gender selectedGender;
  int weight = 70;
  int height = 120;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MyContainer(
                  onClick: (){
                    setState(() {
                      updateGenderCardColor(Gender.male);
                      selectedGender = Gender.male;
                    });
                  },
                  color: maleCardColor,
                  child: GenderCard(
                    label: "male",
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyContainer(
                  onClick: (){
                    setState(() {
                      updateGenderCardColor(Gender.female);
                      selectedGender = Gender.female;
                    });

                  },
                  color: femaleCardColor,
                  child: GenderCard(
                    label: "female",
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: MyContainer(
            color: inActiveCardColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                        color: Colors.white38,
                        fontSize: 19.0
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        "$height",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70.0
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 19.0
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.teal,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 13.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0
                      ),
                      overlayColor: Colors.white30,
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 100.0,
                      max: 250.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: MyContainer(
                  color: inActiveCardColor,
                  child: BottomCard(
                    labelOne: "WEIGHT",
                    labelTwo: weight.toString(),
                    onPlusBtnClick: (){
                      setState(() {
                        weight += 1;
                      });
                    },
                    onMinusBtnClick: (){
                      setState(() {
                        weight -= 1;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MyContainer(
                  color: inActiveCardColor,
                  child: BottomCard(
                    labelOne: "AGE",
                    labelTwo: age.toString(),
                    onPlusBtnClick: (){
                      setState(() {
                        age += 1;
                      });
                    },
                    onMinusBtnClick: (){
                      setState(() {
                        if(age != 0)
                          age -= 1;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            CalculateBMI calc = CalculateBMI(height = height, weight = weight);

            Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultScreen(
                    bmiResult: calc.calculateBMI(),
                    resultTxt: calc.getResult(),
                    interpretation: calc.interpretation(),
                  );
              },),);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10.0)
            ),
            height: 70.0,
            width: double.infinity,
            child: Center(
              child: Text(
                "CALCULATE BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

