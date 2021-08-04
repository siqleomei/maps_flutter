import 'package:get/get.dart';
import 'package:getstarted_maps/bindings/direction/direction_binding.dart';
import 'package:getstarted_maps/bindings/marker/marker_binding.dart';
import 'package:getstarted_maps/ui/map_screen/map_screen.dart';

part './app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: ()=> MapScreen(), bindings: [
      DirectionBinding(),
      MarkerBinding(),
    ])
  ];
}