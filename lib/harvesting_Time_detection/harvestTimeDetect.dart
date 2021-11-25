import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harVestModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HarvestHistroy extends StatefulWidget {
  static String routeNameHarvHistry = "/histry";
  @override
  _HarvestHistroyState createState() => _HarvestHistroyState();
}

class _HarvestHistroyState extends State<HarvestHistroy> {
 // Future<List<Harvest_Status>> futureData;
  List harvest_History = [];
  bool isLoading = false;

    fetchData() async{
    final response = await http.get(Uri.parse('http://192.168.8.103:3302/environment/Harvest_history'));
    setState(() {
      isLoading = true;
    });
    if(response.statusCode==200){
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        harvest_History=jsonResponse;
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
    if(harvest_History.contains(null) || harvest_History.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),));
    }
    return ListView.builder(
        itemCount: harvest_History.length,
        itemBuilder: (context,index){
          return getCard(harvest_History[index]);
        });
  }
  Widget getCard(items){
      var date = items['Date'];
      var harvestTime = items['Havest_time'];
      var expairDate = items['expairDate'];
      var status = items['status_har'];

      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Column(
              children: <Widget>[
                Text("Crop Has Been Harvested on",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(
                  //height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                  ),
                  child: Text(date,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 20,),
                Text("Havest_time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
                Text(harvestTime,style: TextStyle(fontSize: 18,color: Colors.red),),
                SizedBox(width: 20,),
                Text("Expair Date of the Crop",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(width: 15,),
                Text(expairDate,style: TextStyle(fontSize: 18,color: Colors.red),),
              ],
            ),
          ),
        ),
      );
      print(date);
      print(harvestTime);
      print(expairDate);
      print(expairDate);
  }
}
