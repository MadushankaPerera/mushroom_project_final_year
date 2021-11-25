import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:mushroom_project_final_year/yeildPrediction/yeild_prdict_Model.dart';

class Yield_prediction extends StatefulWidget {
  static String routeNameYeild1 = "/yield2";

  @override
  _Yield_predictionState createState() => _Yield_predictionState();
}

class _Yield_predictionState extends State<Yield_prediction> {
  List UserData;
  double Temp = 0;
  double co = 0;
  double humi = 0;
  String diease;
  String havestTime;

  int Humidity;
  int Corbon;
  int TempertureValue;

  getUserdata() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.8.103:3302/environment'));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for (int x = 0; x <= 24; x++) {
      // print(UserData[x]["Temperature"]);
      Temp = Temp + ((UserData[x]["Temperature"]));
      co = co + (UserData[x]["Carbondioxide"]);
      humi = humi + (UserData[x]["Humidity"]);
    }
    diease = (UserData[0]["Presence_or_Absence_of_Disease"]);
    havestTime = (UserData[0]["Ideal_harvesting_time"]);
    ;
    TempertureValue = (Temp / 24.0).toInt();
    Corbon = (co / 24.0).toInt();
    Humidity = (humi / 24.0).toInt();
    print("Day01*****************");
    print(diease);
    print(havestTime);
    print(Temp);
    print(TempertureValue);
    print(co);
    print(Corbon);
    print(humi);
    print(Humidity);
    setState(() {
      UserData = UserData as List;
    });
  }

  //////////////////////////////////////////////////
  //day 02
  List UserData2;
  double Temp2 = 0;
  double co2 = 0;
  double humi2 = 0;
  String diease2;
  String havestTime2;

  int Humidity2;
  int Corbon2;
  int TempertureValue2;

  getUserdata2() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.8.103:3302/environment'));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for (int x = 25; x <= 48; x++) {
      // print(UserData[x]["Temperature"]);
      Temp2 = Temp2 + ((UserData[x]["Temperature"]));
      co2 = co2 + (UserData[x]["Carbondioxide"]);
      humi2 = humi2 + (UserData[x]["Humidity"]);
    }
    diease2 = (UserData[25]["Presence_or_Absence_of_Disease"]);
    havestTime2 = (UserData[25]["Ideal_harvesting_time"]);
    ;
    TempertureValue2 = (Temp2 / 24.0).toInt();
    Corbon2 = (co2 / 24.0).toInt();
    Humidity2 = (humi2 / 24.0).toInt();
    print("Day 02************");
    print(diease2);
    print(havestTime2);
    print(Temp2);
    print(TempertureValue2);
    print(co2);
    print(Corbon2);
    print(humi2);
    print(Humidity2);
    setState(() {
      UserData = UserData as List;
    });
  }

  //////////////////////////////////////////////////
  //day 03
  List UserData3;
  double Temp3 = 0;
  double co3 = 0;
  double humi3 = 0;
  String diease3;
  String havestTime3;

  int Humidity3;
  int Corbon3;
  int TempertureValue3;

  getUserdata3() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.8.103:3302/environment'));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for (int x = 49; x <= 73; x++) {
      // print(UserData[x]["Temperature"]);
      Temp3 = Temp3 + ((UserData[x]["Temperature"]));
      co3 = co3 + (UserData[x]["Carbondioxide"]);
      humi3 = humi3 + (UserData[x]["Humidity"]);
    }
    diease3 = (UserData[49]["Presence_or_Absence_of_Disease"]);
    havestTime3 = (UserData[49]["Ideal_harvesting_time"]);
    ;
    TempertureValue3 = (Temp3 / 24.0).toInt();
    Corbon3 = (co3 / 24.0).toInt();
    Humidity3 = (humi3 / 24.0).toInt();
    print("Day03***************");
    print(diease3);
    print(havestTime3);
    print(Temp3);
    print(TempertureValue3);
    print(co3);
    print(Corbon3);
    print(humi3);
    print(Humidity3);
    setState(() {
      UserData = UserData as List;
    });
  }

  //////////////////////////////////////////////////
  //day 04
  List UserData4;
  double Temp4 = 0;
  double co4 = 0;
  double humi4 = 0;
  String diease4;
  String havestTime4;

  int Humidity4;
  int Corbon4;
  int TempertureValue4;

  getUserdata4() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.8.103:3302/environment'));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for (int x = 74; x <= 97; x++) {
      // print(UserData[x]["Temperature"]);
      Temp4 = Temp4 + ((UserData[x]["Temperature"]));
      co4 = co4 + (UserData[x]["Carbondioxide"]);
      humi4 = humi4 + (UserData[x]["Humidity"]);
    }
    diease4 = (UserData[74]["Presence_or_Absence_of_Disease"]);
    havestTime4 = (UserData[74]["Ideal_harvesting_time"]);
    TempertureValue4 = (Temp4 / 24.0).toInt();
    Corbon4 = (co4 / 24.0).toInt();
    Humidity4 = (humi4 / 24.0).toInt();
    print("Day04**************");
    print(diease4);
    print(havestTime4);
    print(Temp4);
    print(TempertureValue4);
    print(co4);
    print(Corbon4);
    print(humi4);
    print(Humidity4);
    setState(() {
      UserData = UserData as List;
    });
  }

  //////////////////////////////////////////////////
  //day 05
  List UserData5;
  double Temp5 = 0;
  double co5 = 0;
  double humi5 = 0;
  String diease5;
  String havestTime5;

  int Humidity5;
  int Corbon5;
  int TempertureValue5;

  getUserdata5() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.8.103:3302/ '));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for (int x = 98; x <= 122; x++) {
      // print(UserData[x]["Temperature"]);
      Temp5 = Temp5 + ((UserData[x]["Temperature"]));
      co5 = co5 + (UserData[x]["Carbondioxide"]);
      humi5 = humi5 + (UserData[x]["Humidity"]);
    }
    diease5 = (UserData[98]["Presence_or_Absence_of_Disease"]);
    havestTime5 = (UserData[98]["Ideal_harvesting_time"]);
    ;
    TempertureValue5 = (Temp5 / 24.0).toInt();
    Corbon5 = (co5 / 24.0).toInt();
    Humidity5 = (humi5 / 24.0).toInt();
    print("Day05**********************");
    print(diease5);
    print(havestTime5);
    print(Temp5);
    print(TempertureValue5);
    print(co5);
    print(Corbon5);
    print(humi5);
    print(Humidity5);
    setState(() {
      UserData = UserData as List;
    });
  }
////////////////////////////////////////////////get data from harvest & disease


///////////////////////////////////////////////////////////////////////////
  TextEditingController YeildController1 = TextEditingController();
  TextEditingController YeildController2 = TextEditingController();
  TextEditingController YeildController3 = TextEditingController();
  TextEditingController YeildController4 = TextEditingController();
  TextEditingController YeildController5 = TextEditingController();
final int yeildValue=100;
  var dataValue;
  List<YeildPrdict> _Yeild_prdictData= new List();
  //send data to node js backend
  Future<String> datafromDB(int yeildValue1) async {
    final response = await http.post(Uri.parse('http://192.168.8.103:3302/environment/yeild_predict'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          "yeild": yeildValue1,
        }));

    dataValue =response.body;
    print(dataValue);
  }
  /////sending to the backend array
  postRequest() async {
    var url ='http://10.0.2.2:5000/yield_prediction';

    Map data = {
      'data': dataValue
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var DataValueOF_Yeild_prdicty = YeildPrdict.fromJson(json.decode(response.body));
    print(DataValueOF_Yeild_prdicty);
    setState(() {
      _Yeild_prdictData.add(DataValueOF_Yeild_prdicty);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserdata();
    getUserdata2();
    getUserdata3();
    getUserdata4();
    getUserdata5();
    datafromDB(yeildValue);
    postRequest();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                height: 80,
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
                height: 20,
              ),
              Text(
                "Yield Prediction ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Temperture Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Temperture Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: TempertureAlert(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Humidity Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Humidity Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: HumidityAlert(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "CO2 Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'CO2 Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: COAlert(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Diseases Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Diseases Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: DiseasAlert(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Harvested In Time Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Harvested In Time Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: HarvestAlert(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Yeild per Day Details",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Yeild Per Day',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: YieldPredictionDetails(),
                          );
                        });
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                child: Buttons(
                  text: "Estimate Monthly Yeild",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Prediction(),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TempertureAlert() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              TempertureValue.toString() + " celcius",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TempertureValue2.toString() + " celcius",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TempertureValue3.toString() + " celcius",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TempertureValue4.toString() + " celcius",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              TempertureValue5.toString() + " celcius",
              style: TextStyle(fontSize: 30),
            ),

            // int Humidity4;
            // int Corbon4;
            // int TempertureValue4;
          ],
        ));
  }

  Widget HumidityAlert() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              Humidity.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Humidity2.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Humidity3.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Humidity4.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Humidity5.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),

            // int Humidity4;
            // int Corbon4;
            // int TempertureValue4;
          ],
        ));
  }

  /////////////////////////////////co
  Widget COAlert() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              Corbon.toString() + " PPM",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Corbon2.toString() + " PPM",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Corbon3.toString() + " PPM",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Corbon4.toString() + " PPM",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Corbon5.toString() + " PPM",
              style: TextStyle(fontSize: 30),
            ),

            // int Humidity4;
            // int Corbon4;
            // int TempertureValue4;
          ],
        ));
  }

  ////////////////////////disease
  Widget DiseasAlert() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              diease.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              diease2.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              diease3.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              diease4.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              diease5.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),

            // int Humidity4;
            // int Corbon4;
            // int TempertureValue4;
          ],
        ));
  }

  //////////////////////////////////////harvest time
  Widget HarvestAlert() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              havestTime.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              havestTime2.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              havestTime3.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              havestTime4.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              havestTime5.toString() + " ",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ));
  }
  Widget Prediction() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text("Estimate Monthly Yeild",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Container(
              height: 150,
              width: 200,
              color: Colors.grey,
              child: Text("29553.3KG per Months",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 150,
              width: 200,
              color: Colors.grey,
              child: Text("Those factors would give Expected mushroom yield.. Rich Harvest",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ],
        ));
  }

  //////////////////////////////////////////

  Widget YieldPredictionDetails() {
    return Container(
      height: 300,
      width: 300,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter Yield"
            ),
            controller: YeildController1,
          ),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Yield"),
            controller: YeildController2,
          ),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Yield"),
            controller: YeildController3,
          ),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Yield"),
            controller: YeildController4,
          ),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Yield"),
            controller: YeildController5,
          ),
        ],
      ),
    );
  }
}
