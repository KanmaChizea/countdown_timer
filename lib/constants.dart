import 'package:flutter/material.dart';

//constants and functions
const bgroundColor = Color(0xffadadc9);
const primaryColor = Color(0xff4d4c5c);
const shadowColor = Color(0xff232023);
const addColon = Text(
  ':',
  style: TextStyle(fontSize: 50),
);

const formatTime = TextStyle(fontSize: 40, color: shadowColor);

var styleButton = ElevatedButton.styleFrom(
    elevation: 10,
    shadowColor: shadowColor,
    shape: const CircleBorder(),
    primary: primaryColor,
    onPrimary: Colors.white,
    padding: const EdgeInsets.all(23),
    textStyle: const TextStyle(fontSize: 30));

formatTimeToString(int time) {
  if (time.toString().length > 1) {
    return time.toString();
  } else {
    return '0${time.toString()}';
  }
}
