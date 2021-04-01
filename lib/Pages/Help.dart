//#region Description
/* 

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion

import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Help');
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "If you need any help please reach out to me, Duncan McBryan via the app page or by email at aslappdurham@gmail.com",
                textScaleFactor: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
