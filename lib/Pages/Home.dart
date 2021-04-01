//#region Description
/*

  Author: Duncan McBryan
  Date of Creation: 2021-03-06
  Updated: 2021-03-07
  Description: Main homepage, allows for navigation between all areas of the
  application.

 */
//#endregion
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ASL App'),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
            icon: Icon(
              Icons.info,
              color: Color.fromRGBO(222, 240, 245, 1),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/About');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                Navigator.pushNamed(context, '/Help');
              },
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(27, 44, 53, 1),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Lessons');
                },
                child: Text('Lessons'),
                color: Color.fromRGBO(222, 240, 245, 1),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Quizzes');
                },
                child: Text('Quizzes'),
                color: Color.fromRGBO(222, 240, 245, 1),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Search');
                },
                child: Text('Search'),
                color: Color.fromRGBO(222, 240, 245, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
