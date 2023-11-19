import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:weather_app/screen/weather_Screen.dart';

import 'controller/location_Method_controller.dart';
import 'controller/theme-Controller.dart';
import 'controller/weather_Data_Controller.dart';
import 'screen/myNavigation.dart';
 

void main() {
  runApp(const MyApp());
}
//Asif : 211-15-4027
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       initialBinding: GetXBindings(),
      title: 'Flutter Demo',
       theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      
      home:   MyNavigationBar(),
    );
  }
}

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LocationMethodController());
    Get.put(WeatherDataController());
    Get.put(ThemeController());
  }

}