import 'dart:convert';
class DiseaseDetect {
  DiseaseDetect({
    this.accuracy,
    this.description,
    this.disease,
    this.recommendation,
  });

  String accuracy;
  String description;
  String disease;
  String recommendation;

  factory DiseaseDetect.fromJson(Map<String, dynamic> json) => DiseaseDetect(
    accuracy: json["accuracy"].toString(),
    description: json["description"]as String,
    disease: json["disease"] as String,
    recommendation: json["recommendation"] as String,
  );


}
