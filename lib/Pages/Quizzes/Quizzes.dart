//#region Description
/*

  Author: Duncan McBryan
  Date of Creation: 2021-03-06
  Updated:
  Description:

 */
//#endregion
import 'package:flutter/material.dart';

class Quizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quizzes'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Home');
              }),
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
            )
          ],
        ),
        body: Column(
          children: [
            Container( //Basic Signs Quiz
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Color.fromRGBO(222, 240, 245, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/BasicSignsQuiz');
                            },
                            child: Text('Start Quiz'),
                            color: Color.fromRGBO(222, 240, 245, 1),
                          ),
                        ),
                        Text(
                          'Basic Signs Quiz',
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/Hello.png",
                      height: double.infinity,
                    ),
                  ],
                ),
              ),
            ), //Basic Signs Lesson
          ],
        ),
      ),
    );
  }
}
