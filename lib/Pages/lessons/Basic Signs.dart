//#region Description
/* 

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion
//#region Description
/*

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/constants.dart';

class BasicSigns extends StatefulWidget {
  @override
  _BasicSignsState createState() => _BasicSignsState();
}

class _BasicSignsState extends State<BasicSigns> {
  int index = 0;
  List<dynamic> responseLesson = LESSON2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(222, 240, 245, 1),
        appBar: AppBar(
          title: Text('BasicSigns'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Lessons');
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                Navigator.pushNamed(context, '/Help');
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              responseLesson[index]['name'],
              textScaleFactor: 3,
            ),
            Image.asset('assets/${responseLesson[index]['image']}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  //Going backwards through lesson
                  onPressed: () {
                    setState(() {
                      if (index == 0) {
                        index = 9;
                      } else
                        index--;
                    });
                  },
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Color.fromRGBO(27, 44, 53, 1),
                  ),
                ),
                FlatButton(
                  //going forwards through lesson
                  onPressed: () {
                    setState(() {
                      if (index == 9) {
                        index = 0;
                      } else
                        index++;
                    });
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Color.fromRGBO(27, 44, 53, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  responseLesson[index]['tips'],
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  softWrap: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
