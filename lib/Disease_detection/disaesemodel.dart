class DiseaseDetect {
  DiseaseDetect({
    this.dateSystem,
    this.diseaseStatus,
    this.diseaseName,
  });

  DateTime dateSystem;
  String diseaseStatus;
  String diseaseName;

  factory DiseaseDetect.fromJson(Map<String, dynamic> json) => DiseaseDetect(
    dateSystem: DateTime.parse(json["DateSystem"]),
    diseaseStatus: json["disease_status"],
    diseaseName: json["disease_name"],
  );

  Map<String, dynamic> toJson() => {
    "DateSystem": "${dateSystem.year.toString().padLeft(4, '0')}-${dateSystem.month.toString().padLeft(2, '0')}-${dateSystem.day.toString().padLeft(2, '0')}",
    "disease_status": diseaseStatus,
    "disease_name": diseaseName,
  };
}
