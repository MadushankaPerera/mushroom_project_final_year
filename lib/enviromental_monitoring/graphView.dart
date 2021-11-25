import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class GraphView extends StatefulWidget {
  static String routeNameGrph = "/grph";
  String dates;

  GraphView({this.dates});

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<Environment> details = [];
  List data;
  String date;
  TooltipBehavior _tooltipBehavior;
  String datesr;
  String campairdates ="02-12-20";
  String temp;

  Future<String> datafromDB(String dat) async {  //get previous data tru the webstorm function
    final response = await http.post(Uri.parse('http://192.168.8.103:3302/environment/Grph'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Date": dat,
        }));

    var data =response.body.toString();
print(data);
    final String jsonString = response.body;
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      details.add(Environment.fromJson(i));
    }
  }

  printing(){
    print(widget.dates);
  }

  @override
  void initState() {
    datafromDB(widget.dates);
    printing();
    super.initState();
  }

  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/ordinary.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "History View",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _tabSection(context),
              ),
              // Container(
              //   height: 500,
              //   child: SfCartesianChart(
              //     title: ChartTitle(text: "Graph View"),
              //     legend: Legend(isVisible: true),
              //     tooltipBehavior: _tooltipBehavior,
              //     series: <ChartSeries>[
              //       StackedLineSeries<Environment, String>(
              //           dataSource: details,
              //           xValueMapper: (Environment data, _) => data.date,
              //           yValueMapper: (Environment data, _) => data.Temperature,
              //           name: "Temperature",
              //           markerSettings: MarkerSettings(isVisible: true)),
              //
              //       // StackedLineSeries<Environment, String>(
              //       //     dataSource: details,
              //       //     xValueMapper: (Environment data, _) => data.date,
              //       //     yValueMapper: (Environment data, _) =>
              //       //         data.Carbondioxide,
              //       //     name: "Carbondioxide",
              //       //     markerSettings: MarkerSettings(isVisible: true)),
              //       //
              //       // StackedLineSeries<Environment,String>(dataSource: details,
              //       //     xValueMapper: (Environment data,_)=> data.date,
              //       //     yValueMapper:  (Environment data,_)=> data.Humidity,
              //       //     name: "Humidity",
              //       //     markerSettings: MarkerSettings(isVisible: true)),
              //     ],
              //     primaryXAxis: CategoryAxis(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(tabs: [
              Tab(child: Text("Temperature",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
              Tab(child: Text("Carbondioxid",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
              Tab(child: Text("Humidity",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
            ]),
          ),
          Container(
            //Add this to give height
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 500,
                  child: SfCartesianChart(
                    //title: ChartTitle(text: "Graph View"),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      StackedLineSeries<Environment, String>(
                          dataSource: details,
                          xValueMapper: (Environment data, _) => data.date,
                          yValueMapper: (Environment data, _) => data.Temperature,
                          name: "Temperature",
                          markerSettings: MarkerSettings(isVisible: true)),

                      // StackedLineSeries<Environment, String>(
                      //     dataSource: details,
                      //     xValueMapper: (Environment data, _) => data.date,
                      //     yValueMapper: (Environment data, _) =>
                      //         data.Carbondioxide,
                      //     name: "Carbondioxide",
                      //     markerSettings: MarkerSettings(isVisible: true)),
                      //
                      // StackedLineSeries<Environment,String>(dataSource: details,
                      //     xValueMapper: (Environment data,_)=> data.date,
                      //     yValueMapper:  (Environment data,_)=> data.Humidity,
                      //     name: "Humidity",
                      //     markerSettings: MarkerSettings(isVisible: true)),
                    ],
                    primaryXAxis: CategoryAxis(),
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 500,
                  child: SfCartesianChart(
                    //title: ChartTitle(text: "Graph View"),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      // StackedLineSeries<Environment, String>(
                      //     dataSource: details,
                      //     xValueMapper: (Environment data, _) => data.date,
                      //     yValueMapper: (Environment data, _) => data.Temperature,
                      //     name: "Temperature",
                      //     markerSettings: MarkerSettings(isVisible: true)),

                      StackedLineSeries<Environment, String>(
                          dataSource: details,
                          xValueMapper: (Environment data, _) => data.date,
                          yValueMapper: (Environment data, _) =>
                              data.Carbondioxide,
                          name: "Carbondioxide",
                          markerSettings: MarkerSettings(isVisible: true)),

                      // StackedLineSeries<Environment,String>(dataSource: details,
                      //     xValueMapper: (Environment data,_)=> data.date,
                      //     yValueMapper:  (Environment data,_)=> data.Humidity,
                      //     name: "Humidity",
                      //     markerSettings: MarkerSettings(isVisible: true)),
                    ],
                    primaryXAxis: CategoryAxis(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 500,
                  child: SfCartesianChart(
                   // title: ChartTitle(text: "Graph View"),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      // StackedLineSeries<Environment, String>(
                      //     dataSource: details,
                      //     xValueMapper: (Environment data, _) => data.date,
                      //     yValueMapper: (Environment data, _) => data.Temperature,
                      //     name: "Temperature",
                      //     markerSettings: MarkerSettings(isVisible: true)),

                      // StackedLineSeries<Environment, String>(
                      //     dataSource: details,
                      //     xValueMapper: (Environment data, _) => data.date,
                      //     yValueMapper: (Environment data, _) =>
                      //     data.Carbondioxide,
                      //     name: "Carbondioxide",
                      //     markerSettings: MarkerSettings(isVisible: true)),

                      StackedLineSeries<Environment,String>(dataSource: details,
                          xValueMapper: (Environment data,_)=> data.date,
                          yValueMapper:  (Environment data,_)=> data.Humidity,
                          name: "Humidity",
                          markerSettings: MarkerSettings(isVisible: true)),
                    ],
                    primaryXAxis: CategoryAxis(),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class Environment {
  Environment(this.date, this.Temperature, this.Humidity, this.Carbondioxide);

  final String date;
  final num Temperature;
  final num Humidity;
  final num Carbondioxide;

  factory Environment.fromJson(Map<String, dynamic> parsedJson) {
    return Environment(
      parsedJson['Time'].toString(),
      parsedJson['Temperature'],
      parsedJson['Humidity'],
      parsedJson['Carbondioxide'],
    );
  }
}
