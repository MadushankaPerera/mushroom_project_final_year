import 'package:flutter/material.dart';
import 'dart:io';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harVestModel.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harvestTimeDetect.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Analyzed_Time extends StatefulWidget {
  static String routeNameAnaTime = "/analys";

  File Imagefile;
  String harvest_Time;
  String Time;
  String harvestStatus;
  String status;

  Analyzed_Time({this.Imagefile, this.harvest_Time, this.Time});

  type() {
    print(harvest_Time);
    print(Time);
  }

  @override
  _Analyzed_TimeState createState() => _Analyzed_TimeState();
}

class _Analyzed_TimeState extends State<Analyzed_Time> {
  String ImagePath = "assets/addImage.png";
  Future<Harvest_Status> _futureHarvestState;
  String YYYY_MM_DD;

  //insert data
  Future<Harvest_Status> submitData(
      String dat, String harTime, String expirdates, String status) async {
    final response = await http.post(
        Uri.parse('http://192.168.8.103:3302/environment/Harvest_status'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "DateSystem": dat,
          "Havest_time": harTime,
          "expairDate": expirdates,
          "status_har": status
        }));
    var data = response.body.toString();

    if (response.statusCode == 201) {
      return Harvest_Status.fromJson(jsonDecode(response.body));
    } else {
      print("ERROR");
      throw Exception('Failed to create ComplainDetails.');
    }
  }

  void data() {
    DateTime dateTime = DateTime.now();
    YYYY_MM_DD = dateTime.toIso8601String().split('T').first;
    print(YYYY_MM_DD);
  }

  @override
  void initState() {
    data();
    super.initState();
  }

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
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Harvest Time Detection",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: widget.Imagefile != null
                      ? Image.file(
                          widget.Imagefile,
                          height: MediaQuery.of(context).size.height / 4,
                        )
                      : Container(
                          //child: Text("no image"),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(ImagePath),
                            fit: BoxFit.cover,
                          )),
                        )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Harvest Time :-",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.Time,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Expiary Date :-",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.harvest_Time,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Harvest Status",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: widget.status == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              child: Buttons(
                                text: "Yes",
                                press: () {
                                  widget.status = "yes";
                                  setState(() {
                                    _futureHarvestState = submitData(
                                        YYYY_MM_DD,
                                        widget.harvest_Time,
                                        widget.Time,
                                        widget.status);
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Buttons(
                                text: "No",
                                press: () {
                                  widget.status = "no";
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: 50,
                    child: Text("Crop Has been Harvested",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                        )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 200,
                child: Buttons(
                  text: "+ View History",
                  press: () {
                    Navigator.pushNamed(
                        context, HarvestHistroy.routeNameHarvHistry);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
