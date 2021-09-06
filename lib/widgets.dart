import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onClick;

  const MyContainer({Key key, this.color, this.child, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: child,
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  final Function onMinusBtnClick;
  final Function onPlusBtnClick;
  final String labelOne;
  final String labelTwo;

  const BottomCard({Key key, this.onMinusBtnClick, this.onPlusBtnClick, this.labelOne, this.labelTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelOne,
            style: TextStyle(
              color: Colors.white38
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            labelTwo,
            style: TextStyle(
                color: Colors.white,
              fontSize: 50.0,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed:onPlusBtnClick,
                backgroundColor: Colors.teal,
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 40.0,
                ),
                elevation: 23.0,
              ),
              FloatingActionButton(
                onPressed:onMinusBtnClick,
                backgroundColor: Colors.teal,
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 40.0,
                ),
                elevation: 23.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onCardClick;

  const GenderCard({Key key, this.icon, this.label, this.onCardClick}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 110.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                label.toUpperCase(),
                style: TextStyle(
                    color: Colors.white38,
                  fontSize: 19
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



