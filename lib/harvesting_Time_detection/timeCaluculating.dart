import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/analysedTimedetection.dart';
import 'package:mushroom_project_final_year/image_utils_class.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harvesttimeModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mushroom_project_final_year/serverError.dart';

class TimeCalculating extends StatefulWidget {
  static String routeNameTimecal = "/timecal";
  @override
  _TimeCalculatingState createState() => _TimeCalculatingState();
}

class _TimeCalculatingState extends State<TimeCalculating> {
  String ImagePath ="assets/addImage.png";
  File imageFile;
  PickedFile pickedFile;
  List<int> imageBytes;
  TextEditingController base64;
  String base;
  Map<String,dynamic> Data;
  List HarvestTimeData;
  String Expiredate;
  String accuracy;
  String time;

  List<HarvestTimeModel> _harvestData= new List();



  //////////////////////////////////sending data to backend
  postRequest() async {
    var url ='http://10.0.2.2:5000/harvest_time';

    Map data = {
      'base_string': base
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var Data = HarvestTimeModel.fromJson(json.decode(response.body));
    setState(() {
      _harvestData.add(Data);
    });
    // print("${response.statusCode}");
    // print("${response.body}");
    // print(_harvestData[0].time);
    // print(_harvestData[0].accuracy);
    // print(_harvestData[0].expiaryDate);
    ///////////////////adding data
    Expiredate=_harvestData[0].expiaryDate;
    accuracy =_harvestData[0].accuracy.toString();
    time =_harvestData[0].time;

    // print(Expiredate);
    // print(accuracy);
    // print(time);
   // return Data;
  }

  @override
  void initState() {
    base64 = TextEditingController(text: '');
   // postRequest();
    super.initState();
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
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
                )),
              ),
              SizedBox(height: 20,),
              Text("Harvest Time Detection",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              Container(
                  child: imageFile != null ? Image.file(
                    imageFile,
                    height:
                    MediaQuery
                        .of(context)
                        .size
                        .height /4,
                  ):Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage(ImagePath),fit: BoxFit.cover,
                    )),
                  )
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: 200,
                child:    Container(
                  height: 50,
                  width: 200,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF17ae26),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10
                            ),
                          )
                          ,elevation: 2),
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('Camera',style: TextStyle(fontSize: 25),),
                        ],
                      ),
                    ),
                  ),
                ),
                // child: Buttons(
                //   text: "Camera",
                //   press: (){
                //     _getFromCamera();
                //   },
                // ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 200,
                child: Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF17ae26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10
                          ),
                        )
                        ,elevation: 2),
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text('Gallery',style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  ),
                ),
                // child: Buttons(
                //   text: "Gallery",
                //   press: (){
                //     _getFromGallery();
                //   },
                // ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF17ae26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10
                        ),
                      )
                      ,elevation: 2),
                  onPressed: () {
                    postRequest();
                    print(Expiredate);
                    print(accuracy);
                    print(time);
                    if(Expiredate==null && time==null){
                      Container(
                        height: 100,
                        width: 100,
                        child: Buttons(
                          text: "Server Connection Error",
                          press: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Server Down',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    content: Serverconnection(),
                                  );
                                });
                          },
                        ),
                      );
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (context) =>    Analyzed_Time(Imagefile:imageFile,harvest_Time:Expiredate,Time:time));
                    }
                   // Navigator.pushNamed(context, Analyzed_Time.routeNameAnaTime);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.refresh_sharp),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('Analyze',style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        base64.text =
            ImageUtils.fileToBase64(File(pickedFile.path));
        base = base64.text;
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        base64.text =
            ImageUtils.fileToBase64(File(pickedFile.path));
        base = base64.text;
      });
    }
  }
  Widget Serverconnection(){
    return Container(
      height: 100.0, // Change as per your requirement
      width: 100.0,
      color: Colors.red,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(image: DecorationImage(
      //   image: AssetImage("assets/ordinary.jpg"),fit: BoxFit.cover,
      // )),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 200,
            // decoration: BoxDecoration(image: DecorationImage(
            //   image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
            // )),
          ),
        ],
      ),
    );
  }
}
