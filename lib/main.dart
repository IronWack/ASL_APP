//#region Description
/*

  Author: Duncan McBryan
  Date of Creation: 2021-02-6
  Updated: 2021-03-31
  Description: File for all my routes allowing me to map different pages
               Together. As well as showing my initial home page.

 */
//#endregion

//#region Imports

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Help.dart';
import 'package:flutter_app/Pages/Quizzes/BasicSignsQuiz.dart';
import 'package:flutter_app/Pages/Quizzes/Results.dart';
import 'package:flutter_app/Pages/Search-context.dart';
import 'package:flutter_app/Pages/lessons/Alphabet.dart';
import 'package:flutter_app/Pages/lessons/Basic%20Signs.dart';
import 'Pages/Loading.dart';
import 'Pages/Home.dart';
import 'Pages/lessons/Lessons.dart';
import 'Pages/Quizzes/Quizzes.dart';
import 'Pages/Search.dart';
import 'Pages/About.dart';
//#endregion

void main() {
  runApp(MaterialApp(
    initialRoute: '/Home',
    routes: {
      '/': (context) => Loading(),
      '/Home': (context) => Home(),
      '/Lessons': (context) => Lessons(),
      '/Quizzes': (context) => Quizzes(),
      '/Search': (context) => Search(),
      '/About': (context) => About(),
      '/Search-context': (context) => SearchContext(),
      '/Help': (context) => Help(),
      '/Alphabet': (context) => Alphabet(),
      '/BasicSigns': (context) => BasicSigns(),
      '/BasicSignsQuiz': (context) => BasicSignsQuiz(),
      '/Results': (context) => Results(),
    },
  ));
}
