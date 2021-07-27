import 'package:getstarted_maps/data/model/directions/directions_model.dart';
import 'package:getstarted_maps/data/provider/directions/directions_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RepositoryDirections {

  final ApiDirections apiDirections;

  RepositoryDirections({required this.apiDirections});

  Future<ModelDirections?> getDirections({ required LatLng origin, required LatLng destination}) async {
    return apiDirections.getDirections(origin: origin, destination: destination);
  }
}