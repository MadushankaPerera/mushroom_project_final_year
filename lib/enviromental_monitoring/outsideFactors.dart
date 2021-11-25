import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/enviromental_monitoring/graphView.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';

class OutSideFactors extends StatefulWidget {
  static String routeNameoutSide ="/outgrph";

  @override
  _OutSideFactorsState createState() => _OutSideFactorsState();
}
@override
class _OutSideFactorsState extends State<OutSideFactors> {

  List UserData;
  double Temp=0;
  double co =0;
  double humi=0;
  String fan_prdict;
  String predictionValue;

  int Humidity;
  int Corbon;
  int TempertureValue;
  String datesvalue;
  String recomandataion;
  TextEditingController dateCtl = TextEditingController();

  getUserdata() async{
    http.Response response =await http.get(Uri.parse('http://192.168.8.103:3302/environment'));
    //debugPrint(response.body);
    UserData = json.decode(response.body);
    for(int x=0; x<=12;x++){

      // print(UserData[x]["Temperature"]);
      Temp=Temp+((UserData[x]["Temperature"]));
      co=co+(UserData[x]["Carbondioxide"]);
      humi = humi+(UserData[x]["Humidity"]);
    }
    TempertureValue = (Temp/12.0).toInt(); //divided of 12
    Corbon = (co/12.0).toInt();
    Humidity = (humi/12.0).toInt();
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
  String rev(String s) {
    return String.fromCharCodes(s.runes.toList().reversed);
  }
  ////////////////////////////////////////////////get 2D array data from webstorm fan prediction
  Future<String> fan_predict() async {
    final response = await http.post(Uri.parse('http://192.168.8.103:3302/environment/environment_array'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "Date": "13-12-20",
        }));
    fan_prdict=response.body;
    print(fan_prdict);
    if(fan_prdict != null){
      for(int i=0;i<=3;i++){
        fan_prdict =fan_prdict.substring(i);
      }
      fan_prdict =fan_prdict.substring(2, fan_prdict.length -1);
    }
    print(fan_prdict);
  }

  ///////////////send 2D array data to anaconda promt(backend)
  Future<String>postRequest(String valueFromDB) async {
    var url ='http://10.0.2.2:5000/fan_prediction';
    String dataDB = valueFromDB;
    print("value inside post request");
    print(dataDB);
    Map data = {
      'data': dataDB    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),   //backend responed
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print(response.body);
    predictionValue = response.body;
    print("Inside predict value");
    print(predictionValue);
    predictionValue =predictionValue.substring(1,predictionValue.length -2);
    print(predictionValue);     // print the predictation value in App
  }

  @override
  void initState(){
    super.initState();
    getUserdata();
   // getEnvironmentalPrediction();
    fan_predict();
    Future.delayed(Duration(seconds: 2), (){
      postRequest(fan_prdict);
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/ordinary.jpg"),fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("assets/mashroom_log.png"),
                  )),
                ),
                SizedBox(height: 20,),
                Text("Envirnmental Monitoring Factors",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 350,
                        width: 170,
                        decoration: BoxDecoration(
                         // color: Color(0xFFDDDDDD),
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75)
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 70,),
                            Text("Temperture ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 15.0,
                                percent: TempertureValue /100,
                                animation: true,
                                animationDuration: 1500,
                                center: new Text(TempertureValue.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                               // header: new Text("Temperture ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                progressColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 25,),
                      Column(
                        children: [
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                              //color: Color(0xFFDDDDDD),
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 0.75)
                                )
                              ],
                            ),
                            child: Container(
                              child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 15.0,
                                percent: Humidity/ 100,
                                animation: true,
                                animationDuration: 1500,
                                center: new Text(Humidity.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                header: new Text("Humidity ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                progressColor: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 160,
                            width: 170,
                            decoration: BoxDecoration(
                              //color: Color(0xFFDDDDDD),
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 0.75)
                                )
                              ],
                            ),
                            child:  Container(
                              child: CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 15.0,
                                percent: (Corbon/10)/100,
                                animation: true,
                                animationDuration: 1500,
                                center: new Text(Corbon.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                header: new Text("Co2  ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                progressColor: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 180,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xFFdcfbc3),
                    borderRadius: new BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75)
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reccomandatation :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Warning ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                          ],
                        ),
                      ),
                      Container(
                        child: predictionValue != null ? Text(predictionValue,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),):Text("Click me to Recomendation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                      ),
                      Buttons(
                        text: "Click me ",
                        press: (){
                          setState(() {

                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("To View The History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 15,),
                Container(
                  height: 20,
                  width: 150,
                  child: TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      // labelText: "Date of birth",
                      hintText: "Select the Date",),
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));
                       //="${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";
                      String da="${date.day.toString()}-${date.month.toString()}-${date.year.toString()}";
                      int i=6;
                      int y =7;
                      datesvalue = da.substring(0, i) + da.substring(i + 2);
                      //String toBesend =da.substring(0, i) + da.substring(i + 1);
                      print(datesvalue);
                      dateCtl.text = datesvalue;
                    },),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 200,
                  child: Buttons(
                    text: "Graph View",
                    press: (){
                      Navigator.pushNamed(context, GraphView.routeNameGrph);
                      showDialog(
                          context: context,
                          builder: (context) =>    GraphView(dates:datesvalue));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

