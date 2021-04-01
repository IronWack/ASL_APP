//#region Description
/* 

  Author: Duncan McBryan
  Date of Creation:
  Updated:
  Description:

 */
//#endregion
import 'package:flutter/material.dart';

class SearchContext extends StatelessWidget {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(27, 44, 53, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Search'),
          elevation: 0,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(data['name']),
                Image.asset("assets/${data['image']}"),
                Text(data['tips']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
