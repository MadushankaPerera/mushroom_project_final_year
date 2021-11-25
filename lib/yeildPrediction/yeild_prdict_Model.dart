class YeildPrdict {
  YeildPrdict({
    this.data,
  });

  List<List<double>> data;

  factory YeildPrdict.fromJson(Map<String, dynamic> json) => YeildPrdict(
    data: List<List<double>>.from(json["data"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}