import 'package:flutter/material.dart';

import 'constants.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultTxt;
  final String interpretation;

  const ResultScreen({Key key,
    @required this.bmiResult,
    @required this.resultTxt,
    @required this.interpretation}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: ResultBody(
          bmiResult: bmiResult,
          resultTxt: resultTxt,
          interpretation: interpretation,
        ),
      ),
    );
  }
}

class ResultBody extends StatelessWidget {
  final String bmiResult;
  final String resultTxt;
  final String interpretation;

  const ResultBody(
      {Key key,
        @required this.bmiResult,
        @required this.resultTxt,
        @required this.interpretation}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "YOUR RESULT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.fromLTRB(14.0, 10.0, 10.0, 14.0),
              decoration: BoxDecoration(
                  color: activeCardColor,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultTxt,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 120.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Center(
                      child: Text(
                        interpretation,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                height: 50.0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "RE-CALCULATE BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



