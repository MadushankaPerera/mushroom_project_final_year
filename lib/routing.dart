import 'package:flutter/cupertino.dart';
import 'package:mushroom_project_final_year/Disease_detection/add_disease_image.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/black.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/greenMud.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/miteAttack.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/neurospora.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/thali.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease_detection_main.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease_history.dart';
import 'package:mushroom_project_final_year/enviromental_monitoring/graphView.dart';
import 'package:mushroom_project_final_year/enviromental_monitoring/outsideFactors.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/analysedTimedetection.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/harvestTimeDetect.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/timeCaluculating.dart';
import 'package:mushroom_project_final_year/navigation.dart';
import 'package:mushroom_project_final_year/splashScreen.dart';
import 'package:mushroom_project_final_year/testing.dart';
import 'package:mushroom_project_final_year/yeildPrediction/testYeild.dart';

import 'yeildPrediction/mainNaviYeild.dart';

final Map<String, WidgetBuilder> routes ={
  SplashScreen.routeName: (context) => SplashScreen(),
  Navigation.routeNameNavi: (context) => Navigation(),
  Disease_Detection_main.routeNameDiseas: (context) => Disease_Detection_main(),
  Add_disease.routeNameDiseasDetect: (context) => Add_disease(),
  BlackMould.routeNameBlack: (context) => BlackMould(),
  TestScreen.routeNameGreen: (context) => TestScreen(),
  MiteAttack.routeNamemite: (context) => MiteAttack(),
  Neurospora.routeNameNeurospora: (context) => Neurospora(),
  ThaliAttack.routeNamethali: (context) => ThaliAttack(),
  TimeCalculating.routeNameTimecal: (context) => TimeCalculating(),
  Analyzed_Time.routeNameAnaTime: (context) => Analyzed_Time(),
  HarvestHistroy.routeNameHarvHistry:(context) => HarvestHistroy(),
  MainNaviYeild.routeNameYeild:(context) => MainNaviYeild(),
  Yield_prediction.routeNameYeild1:(context) => Yield_prediction(),
  OutSideFactors.routeNameoutSide:(context) => OutSideFactors(),
  GraphView.routeNameGrph:(context) => GraphView(),
  DisaeseHistory.routeNameDiseHistry:(context) => DisaeseHistory(),
  Test123.routeNameTest:(context) => Test123(),

};