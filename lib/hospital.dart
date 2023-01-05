
import 'package:flutter_application_1/location.dart';
import 'package:flutter_application_1/waiting.dart';


class Hospital {
  static int _counter = 0;
  int? id;
  String? name;
  // List<WaitingList>? waitingList;
  final List<WaitingList>? waitingList;
  Location? location;

  Hospital({this.id, this.name, this.waitingList, this.location});

  factory Hospital.fromJson(Map<String, dynamic> json) {


    // print('Hospital 1');
    var wList = json['waitingList'] as List;
    List<WaitingList> waitingList = wList.map((i) => WaitingList.fromJson(i)).toList();
    // print('Hospital 2');
    // print('Hospital From json = $_counter');_counter++;
    return Hospital(
      id: json['id'],
      name: json['name'],
      // waitingList: parseWaitingList(json['waitingList']),
      waitingList: waitingList,
      location: Location.fromJson(json['location']),
    );
  }

  List<WaitingList> parseWaitingList(List<dynamic> list) {
    return list.map((e) => WaitingList.fromJson(e)).toList();
  }

  @override
  String toString() {
    // print('toString');
    return '{ id = ${this.id}, name = ${this.name}}';
  }
}