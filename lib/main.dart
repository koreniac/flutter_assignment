import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/hospital.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TEST',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Hospitals'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> hospitals = [];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  void _loadData() async{
    //
    //"https://api.jsonbin.io/v3/b/639982fe01a72b59f2300654";
    //https://mocki.io/v1/1767663d-57dd-4da2-ae7d-d5ae2390fc43
    var url = Uri.https('api.jsonbin.io', '/v3/b/639982fe01a72b59f2300654');
    // var url = Uri.https('mocki.io', '/v1/1767663d-57dd-4da2-ae7d-d5ae2390fc43');
    var response = await http.get(url, headers: {"Accept": "application/json"});
    print('Response status: ${response.statusCode}');
    sleep(Duration(seconds:1));

    //stop  reload
    if(response.statusCode != 200){// display error

    }else{//display result
      // print('Response body: ${response.body}');
      var jsonStringDecode = json.decode(response.body);
      var jsonHospitals = jsonStringDecode['record']['hospitals']['hospitals'];
      hospitals = jsonHospitals.map((e) => Hospital.fromJson(e)).toList();

      print('hospitals complete');
      for( var a=0; a < hospitals.length; a++){
        Hospital hos = hospitals[a];
         print('hospitals[${a}] = '+ hos.toString());

          // hos.toString();
      }
        setState(() {
      });
    }



  }
  @override
  void initState(){
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,style: TextStyle(color: Color(0xffffffff))),
      ),
      body: ListView.builder(
            itemExtent: 100.0,
            itemCount: hospitals.length,
            itemBuilder: (context, index){
              return Padding(
                // padding: EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Card(
                  child: Center(
                    child: ListTile(
                      minLeadingWidth : 0,
                      leading: Icon(Icons.medical_services, color: Colors.black),
                      title: Text('${hospitals[index].name}', style: TextStyle(color: Color(0xff000000))),
                      textColor: Colors.black,

                    )
                  ),
                ),
            );

            }
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
