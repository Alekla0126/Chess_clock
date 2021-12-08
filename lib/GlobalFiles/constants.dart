library constants;

import './game.dart';
import 'package:flutter/material.dart';

const List<Game> SELECTABLE_GAMES = [
  Game(
      name: 'Bullet I',
      timeWhite: Duration(minutes: 1),
      timeBlack: Duration(minutes: 1),
      incrementWhite: Duration(seconds: 0),
      incrementBlack: Duration(seconds: 0)),
  Game(
      name: 'Bullet II',
      timeWhite: Duration(minutes: 2),
      timeBlack: Duration(minutes: 2),
      incrementWhite: Duration(seconds: 1),
      incrementBlack: Duration(seconds: 1)),
  Game(
      name: 'Blitz I',
      timeWhite: Duration(minutes: 3),
      timeBlack: Duration(minutes: 3),
      incrementWhite: Duration(seconds: 2),
      incrementBlack: Duration(seconds: 2)),
  Game(
      name: 'Blitz II',
      timeWhite: Duration(minutes: 5),
      timeBlack: Duration(minutes: 5),
      incrementWhite: Duration(seconds: 0),
      incrementBlack: Duration(seconds: 0)),
  Game(
      name: 'Blitz III',
      timeWhite: Duration(minutes: 5),
      timeBlack: Duration(minutes: 5),
      incrementWhite: Duration(seconds: 3),
      incrementBlack: Duration(seconds: 3)),
  Game(
      name: 'Rapid',
      timeWhite: Duration(minutes: 10),
      timeBlack: Duration(minutes: 10),
      incrementWhite: Duration(seconds: 0),
      incrementBlack: Duration(seconds: 0)),
  Game(
      name: 'Classical',
      timeWhite: Duration(minutes: 15),
      timeBlack: Duration(minutes: 15),
      incrementWhite: Duration(seconds: 15),
      incrementBlack: Duration(seconds: 15)),
];

const colorsLight = {
  'black': Colors.blueGrey,
  'white': Colors.white,
  'accent': Color.fromRGBO(156, 39, 31, 1.0),
  'background': Color.fromRGBO(245, 245, 245, 0.8,),
  'bar': Color.fromRGBO(245, 245, 245, 0.8,),
};

const colorsDark = {
  'bar': Colors.deepPurple,
  'grid_background': Color(0xff3f3f4f),
  'black': Color(0xffa3a3c4),
  'white': Color.fromRGBO(100, 51, 180, 1.0),
  'accent': Color(0xffc7c7c7),
  'buttons': Color.fromRGBO(138, 40, 40, 1.0),
  'background': Color(0xff1e1e27),
};
