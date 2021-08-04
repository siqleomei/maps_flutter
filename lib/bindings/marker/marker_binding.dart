import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/marker/marker_controller.dart';
import 'package:getstarted_maps/data/provider/marker/marker_api.dart';
import 'package:getstarted_maps/data/repository/marker/marker_repository.dart';

class MarkerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      return MarkerController(
          markerRepository: MarkerRepository(
            apiMarker: ApiMarker(),
        ),
      );
    });
  }

}