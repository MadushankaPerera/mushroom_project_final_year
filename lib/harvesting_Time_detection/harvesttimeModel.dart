import 'dart:convert';

class HarvestTimeModel {

  String expiaryDate;
  double accuracy;
  String time;

  HarvestTimeModel({
    this.expiaryDate,
    this.accuracy,
    this.time,
  });

  factory HarvestTimeModel.fromJson(Map<String, dynamic> json) {
    return HarvestTimeModel(
      expiaryDate: json["Expiary Date"]as String,
      accuracy: json["accuracy"] as double,
      time: json["time"] as String,

    );
  }

}