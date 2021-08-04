import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/directions/direction_controller.dart';
import 'package:getstarted_maps/data/provider/directions/directions_api.dart';
import 'package:getstarted_maps/data/repository/directions/directions_repository.dart';

class DirectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      return DirectionController(
          repositoryDirections: RepositoryDirections(
          apiDirections: ApiDirections(),
        ),
      );
    });
  }

}