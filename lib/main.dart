import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstarted_maps/bindings/marker/marker_binding.dart';
import 'package:getstarted_maps/routes/app_pages.dart';
import 'package:getstarted_maps/ui/map_screen/map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      initialBinding: MarkerBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      home: MapScreen(),
    );
  }
}
