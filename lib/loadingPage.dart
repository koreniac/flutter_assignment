import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Simulate a long loading process
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Hospitals'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: CircularProgressIndicator(
      //     ),

      // ),
      body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: new CircularProgressIndicator(
                              strokeWidth: 15,
                              // value: 1.0,
                            ),
                          ),
                        ),
                        Center(child: Text("Loading")),
                      ],
                    ),
                  ),
                ],
              )
    );
  }
}