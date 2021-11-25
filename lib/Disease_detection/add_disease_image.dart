import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/black.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/greenMud.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/miteAttack.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/neurospora.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/thali.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease_history.dart';
import 'package:mushroom_project_final_year/Disease_detection/diseasedetect.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/image_utils_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Add_disease extends StatefulWidget {
  static String routeNameDiseasDetect = "/diseasDetect";
  @override
  _Add_diseaseState createState() => _Add_diseaseState();
}

class _Add_diseaseState extends State<Add_disease> {
  Future<DiseaseDetect> _futureDiseaseState;
  String ImagePath ="assets/addImage.png";
  File imageFile;
  PickedFile pickedFile;
  List<int> imageBytes;
  TextEditingController base64;
  String base;
  String accuracy;
  String description;
  String disease;
  String recommendation;
  String Makka;
  String diseaseStatus ="yes";

  String v1 ="Black Mould";
  String v2="Green Mould";
  String v3="Mite Attack";
  String v4="Neurospora";
  String YYYY_MM_DD;

  List<DiseaseDetect> _diseaseData= new List();
  /////date selectrion
  void data(){
    DateTime dateTime = DateTime.now();
    YYYY_MM_DD = dateTime.toIso8601String().split('T').first;
    print(YYYY_MM_DD);
  }

  postData()async{
    var url ='http://10.0.2.2:5000/disease_detect';
    Map data = {
      'base_string': base
    };
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var Data = DiseaseDetect.fromJson(json.decode(response.body));
    setState(() {
      _diseaseData.add(Data);
    });
    accuracy= _diseaseData[0].accuracy;
    description =_diseaseData[0].description;
    disease =_diseaseData[0].disease;
    recommendation =_diseaseData[0].recommendation;
     print(accuracy);
     print(description);
     print(disease);
    // print(recommendation);

    //print(response.body);
  }
  //insert data
  Future<DiseaseDetect> submitData(String dat, String diseasSta, String diseasname) async {
    final response = await http.post(Uri.parse('http://192.168.8.103:3302/environment/disease_status'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: jsonEncode(<String, String>{
      "DateSystem": dat,
      "disease_status": diseasSta,
      "disease_name": diseasname
    }));
    var data =response.body.toString();

    if(response.statusCode ==201){
      return DiseaseDetect.fromJson(jsonDecode(response.body));
    }else{
      print("ERROR");
      throw Exception('Failed to create ComplainDetails.');
    }
  }
  @override
  void initState() {
    base64 = TextEditingController(text: '');
    postData();
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
              SizedBox(height: 40,),
              Container(
                child: imageFile != null ? Image.file(
                  imageFile,
                  height: MediaQuery
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      child: Buttons(
                        text: "Camera",
                        press: (){
                          _getFromCamera();
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 50,
                      width: 150,
                      child: Buttons(
                        text: "Gallery",
                        press: (){
                          _getFromGallery();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Analyze on Mushroom Cap",
                  press: (){
                    postData()async{
                      var url ='http://10.0.2.2:5000/makka_detect';
                      Map data = {
                        'base_string': base
                      };
                      var body = json.encode(data);

                      var response = await http.post(Uri.parse(url),
                          headers: {"Content-Type": "application/json"},
                          body: body
                      );
                      var Data = DiseaseDetect.fromJson(json.decode(response.body));
                      setState(() {
                        _diseaseData.add(Data);
                      });
                      Makka= _diseaseData[0].accuracy;
                      description =_diseaseData[0].description;
                      disease =_diseaseData[0].disease;
                      recommendation =_diseaseData[0].recommendation;
                      print(accuracy);
                      print(description);
                      print(disease);
                      print(recommendation);

                      //print(response.body);
                    }
                    postData();
                    setState(() {
                      _futureDiseaseState = submitData(YYYY_MM_DD, "yes", "thali makka attack");
                    });
                    showDialog(
                        context: context,
                        builder: (context) =>    ThaliAttack(accuracy: accuracy,disease: disease,Discription: description,recommendation: recommendation,));
                  },
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Analyze on Cultivation Bag",
                  press: (){
                    postData();
                    String v1 ="Black Mould";
                    String v2="Green Mould";
                    String v3="Mite Attack";
                    String v4="Neurospora";
                    // print(description);
                    // print(recommendation);
                    // print(disease);
                    setState(() {
                      _futureDiseaseState = submitData(YYYY_MM_DD, "yes", disease );
                    });
                    if(v1==disease){
                      showDialog(
                          context: context,
                          builder: (context) =>    BlackMould(disease: disease,Discription: description,recommendation: recommendation,));
                      Navigator.pushNamed(context, BlackMould.routeNameBlack);
                    }
                    else if(v2==disease){
                      showDialog(
                          context: context,
                          builder: (context) =>    TestScreen(disease: disease,Discription: description,recommendation: recommendation,));
                    }
                    else if(v3==disease){
                      showDialog(
                          context: context,
                          builder: (context) =>    MiteAttack(disease: disease,Discription: description,recommendation: recommendation,));
                    }
                    else if(v4==disease){
                      showDialog(
                          context: context,
                          builder: (context) =>    Neurospora(disease: disease,Discription: description,recommendation: recommendation,));
                    }
                    else{
                      //error in internet connection
                    }

                  },
                ),
              ),
              SizedBox(height: 20,),
              Buttons(
                text: "View History",
                press: (){
                  Navigator.pushNamed(context, DisaeseHistory.routeNameDiseHistry);
                },
              )
            ],
          ),
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
}
