//#region Description
/* 

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class BasicSignsQuiz extends StatefulWidget {
  @override
  _BasicSignsQuizState createState() => _BasicSignsQuizState();
}

class _BasicSignsQuizState extends State<BasicSignsQuiz> {
  List<dynamic> responseQuiz = LESSON2;

  List<int> poolQuiz = [];
  List<int> poolAnswer = [];

  int max = LESSON2.length;
  var randomChoice = new Random();

  int group;

  int option1 = 1;
  int option2 = 0;
  int option3 = 3;

  int counter = 0;
  int wrong = 0;
  int correct = 0;

  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    responseQuiz.forEach((element) {
      poolAnswer.add(element["index"]);
    });

    responseQuiz.forEach((element) {
      poolQuiz.add(element["index"]);
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Basic Signs Quiz'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                Navigator.pushNamed(context, '/Help');
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Question: " + (counter).toString() + "/10",
                  textScaleFactor: 1.5,
                ),
              ],
            ),
            Image.asset('assets/${responseQuiz[correctAnswer]['image']}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: group,
                  onChanged: (T) {
                    if (counter ==
                        max) // Check to see if we are done with questions
                        {
                      Navigator.pushNamed(context, '/Results', arguments: {
                        'correct': correct,
                        'wrong': wrong,
                      });
                    } else if (option1 == correctAnswer) {
                      setState(
                            () {
                          group = T;
                          group = null;
                        },
                      );
                    } else {
                      setState(
                            () {
                          correctAnswer = poolAnswer[
                          randomChoice.nextInt(poolAnswer.length)];
                          poolAnswer.removeAt(correctAnswer);
                          poolQuiz.removeAt(correctAnswer);
                          option1 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.removeAt(option1);
                          option2 = correctAnswer;
                          option3 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.add(correctAnswer);
                          wrong++;

                          counter++;
                          group = T;
                          group = null;
                        },
                      );
                    }
                  },
                ),
                Radio(
                  value: 2,
                  groupValue: group,
                  onChanged: (T) {
                    if (counter ==
                        max) // Check to see if we are done with questions
                        {
                      Navigator.pushNamed(context, '/Results', arguments: {
                        'correct': correct,
                        'wrong': wrong,
                      });
                    } else if (option2 == correctAnswer) {
                      setState(
                            () {
                          counter++;

                          correct++;
                          correctAnswer = poolAnswer[
                          randomChoice.nextInt(poolAnswer.length)];
                          poolAnswer.removeAt(correctAnswer);
                          poolQuiz.removeAt(correctAnswer);
                          option1 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.removeAt(option1);
                          option2 = correctAnswer;
                          option3 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.add(correctAnswer);
                          group = T;
                          group = null;
                        },
                      );
                    }
                  },
                ),
                Radio(
                  value: 3,
                  groupValue: group,
                  onChanged: (T) {
                    if (counter ==
                        max) // Check to see if we are done with questions
                        {
                      Navigator.pushNamed(context, '/Results', arguments: {
                        'correct': correct,
                        'wrong': wrong,
                      });
                    } else if (option3 == correctAnswer) {
                      setState(
                            () {
                          option1 = group = T;
                          group = null;
                        },
                      );
                    } else if (option1 == correctAnswer) {
                      setState(
                            () {
                          group = T;
                          group = null;
                        },
                      );
                    } else {
                      setState(
                            () {
                          correctAnswer = poolAnswer[
                          randomChoice.nextInt(poolAnswer.length)];
                          poolAnswer.removeAt(correctAnswer);
                          poolQuiz.removeAt(correctAnswer);
                          option1 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.removeAt(option1);
                          option2 = correctAnswer;
                          option3 =
                          poolQuiz[randomChoice.nextInt(poolQuiz.length)];
                          poolQuiz.add(correctAnswer);
                          wrong++;

                          counter++;
                          group = T;
                          group = null;
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  responseQuiz[option1]['name'],
                  textScaleFactor: 1,
                  softWrap: true,
                ),
                Text(
                  responseQuiz[option2]['name'],
                  textScaleFactor: 1,
                  softWrap: true,
                ),
                Text(
                  responseQuiz[option3]['name'],
                  textScaleFactor: 1,
                  softWrap: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
Alert to inform the user they are about to leave the quiz, and ask them what
they would like to do.
  Yes: Leave quiz and go back to quizzes screen.
  No: Get rid of alert message and continue quiz.
*/
showAlertDialog(BuildContext context) {
  Widget yesButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, '/Quizzes');
    },
  );
  Widget noButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Leave quiz?"),
    content: Text("You are about to leave the quiz, would you like to?"),
    actions: [
      yesButton,
      noButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
