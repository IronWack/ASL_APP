/*

  Author: Duncan McBryan
  Date of Creation: 
  Updated:
  Description: 

 */
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Home');
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                Navigator.pushNamed(context, '/Help');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello my is Duncan McBryan, thanks for downloading and "
                "using my app, it means a lot to me I hope that you learn some "
                "ASL. If you have any suggestions or wish to reach out to me, "
                "you can find me at aslappdurham@gmail.com or leave a review on "
                "the app page.",
                textScaleFactor: 1.5,
              ),
              Text("Attributes:"),
              Text("https://www.freepik.com/vectors/hand"),
            ],
          ),
        ),
      ),
    );
  }
}
