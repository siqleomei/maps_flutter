import 'package:get/get.dart';
import 'package:getstarted_maps/data/model/directions/directions_model.dart';
import 'package:getstarted_maps/data/repository/directions/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionController extends GetxController{
  final RepositoryDirections repositoryDirections;

  DirectionController({required this.repositoryDirections});

  final _info = ModelDirections().obs;

  get info => this._info.value;
  set info(value) => this._info.value = value;

  Future<ModelDirections?> getDirections({ required LatLng origin, required LatLng destination}) async {
    return repositoryDirections.getDirections(origin: origin, destination: destination);
  }
}