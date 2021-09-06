class CalculateBMI{
  final int height;
  final int weight;
  double _bmi;

  CalculateBMI(this.height, this.weight);

  String calculateBMI(){
    double newHeight = height/100;
    _bmi = (weight / (newHeight*newHeight));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25)
      return "Over Weight";
    else if(_bmi >= 18.5){
      return "Normal";
    }else{
      return "Under Weight";
    }
  }

  String interpretation(){
    if(_bmi >= 25)
      return "You have more than normal weight. Try to exercise!";
    else if(_bmi >= 18.5){
      return "You have weight. Good job!";
    }else{
      return "You have less than normal weight. Try to eat more!";
    }
  }
}