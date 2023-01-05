import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/hospital.dart';
import 'package:flutter_application_1/mapLocationPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {

  final String title;


  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<dynamic> hospitals = [];



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
        title: Text(widget.title , style: TextStyle(color: Color(0xffffffff))),
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
                      onTap: (){
                        setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => Center(
                                        child: Container(
                                          // height: 400,
                                          // width: 200,
                                          child: MapPage(title:hospitals[index].name, hosLocation: hospitals[index].location),
                                        ),
                                      ),
                                )
                            );
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => MapPage(),
                            //   ),
                            // );
                        });
                      }
                  ),
                ),
                ),
            );

            }
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
