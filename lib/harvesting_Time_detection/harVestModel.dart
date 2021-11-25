
class Harvest_Status {
  Harvest_Status({
    this.dateSystem,
    this.havestTime,
    this.expairDate,
    this.statusHar,
  });

  DateTime dateSystem;
  String havestTime;
  String expairDate;
  String statusHar;

  factory Harvest_Status.fromJson(Map<String, dynamic> json) => Harvest_Status(
    dateSystem: DateTime.parse(json["DateSystem"]),
    havestTime: json["Havest_time"],
    expairDate: json["expairDate"],
    statusHar: json["status_har"],
  );

  Map<String, dynamic> toJson() => {
    "DateSystem": "${dateSystem.year.toString().padLeft(4, '0')}-${dateSystem.month.toString().padLeft(2, '0')}-${dateSystem.day.toString().padLeft(2, '0')}",
    "Havest_time": havestTime,
    "expairDate": expairDate,
    "status_har": statusHar,
  };
}