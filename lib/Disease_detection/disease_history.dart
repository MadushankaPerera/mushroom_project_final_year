import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harVestModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisaeseHistory extends StatefulWidget {
  static String routeNameDiseHistry = "/dishistry";
  @override
  _DisaeseHistoryState createState() => _DisaeseHistoryState();
}

class _DisaeseHistoryState extends State<DisaeseHistory> {
  // Future<List<Harvest_Status>> futureData;
  List disease_History = [];
  bool isLoading = false;

  fetchData() async{
    final response = await http.get(Uri.parse('http://192.168.8.103:3302/environment/Disease_history'));
    setState(() {
      isLoading = true;
    });
    if(response.statusCode==200){
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        disease_History=jsonResponse;
        isLoading = false;
      });
      return jsonResponse.map((e) => new Harvest_Status.fromJson(e)).toList();
    }else{
      throw Exception("unexpected error occured");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
  Widget getBody(){
    if(disease_History.contains(null) || disease_History.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),));
    }
    return ListView.builder(
        itemCount: disease_History.length,
        itemBuilder: (context,index){
          return getCard(disease_History[index]);
        });
  }
  Widget getCard(items){
    var date = items['DateSystem'];
    var DiseaseName = items['disease_name'];


    return DiseaseName != null ? Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text("Crop Disease Was detected on",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(
                //height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(date,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 20,),
              Text("Disease Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(width: 15,),
              Text(DiseaseName,style: TextStyle(fontSize: 18,color: Colors.red),),
            ],
          ),
        ),
      ),
    ): null;
    print(date);

  }
}
