import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/directions/direction_controller.dart';
import 'package:getstarted_maps/controllers/marker/marker_controller.dart';
import 'package:getstarted_maps/data/provider/directions/directions_api.dart';
import 'package:getstarted_maps/data/provider/marker/marker_api.dart';
import 'package:getstarted_maps/data/repository/directions/directions_repository.dart';
import 'package:getstarted_maps/data/repository/marker/marker_repository.dart';

class MarkerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        MarkerController(
          markerRepository: MarkerRepository(
            apiMarker: ApiMarker(),
          ),
        ),
        permanent: true);
    Get.put(
        DirectionController(
          repositoryDirections: RepositoryDirections(
            apiDirections: ApiDirections(),
          ),
        ),
        permanent: true);
  }
}
