

class WaitingList {
  int? patientCount;
  int? levelOfPain;
  int? averageProcessTime;

  WaitingList({this.patientCount, this.levelOfPain, this.averageProcessTime});

  factory WaitingList.fromJson(Map<String, dynamic> json) {
    // print('WaitingList 1');
    return WaitingList(
      patientCount: json['patientCount'],
      levelOfPain: json['levelOfPain'],
      averageProcessTime: json['averageProcessTime'],
    );
  }

  @override
  String toString() {
    return '{ patientCount = ${this.patientCount}, levelOfPain = ${this.levelOfPain}, averageProcessTime = ${this.averageProcessTime} }';
  }
}