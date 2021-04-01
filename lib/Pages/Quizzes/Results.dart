//#region Description
/* 

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Results'),
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
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'You got ',
                      textScaleFactor: 2,
                    ),
                    Text(
                      data['wrong'].toString(),
                      textScaleFactor: 2,
                    ),
                    Text(
                      ' wrong!',
                      textScaleFactor: 2,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'You got ',
                      textScaleFactor: 2,
                    ),
                    Text(
                      data['correct'].toString(),
                      textScaleFactor: 2,
                    ),
                    Text(
                      ' right!',
                      textScaleFactor: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
