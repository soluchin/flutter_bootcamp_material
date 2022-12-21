import 'package:flutter/material.dart';

class DateValueNotifier with ChangeNotifier {
  DateTime date = DateTime.now();

  DateTime get getDate => date;
  bool isEven() {
    return (date.day % 2 == 0) ? true : false;
  }

  picked(DateTime newValue) {
    date = newValue;
    notifyListeners();
  }
}
