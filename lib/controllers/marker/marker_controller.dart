import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/directions/direction_controller.dart';
import 'package:getstarted_maps/data/model/marker/marker_model.dart';
import 'package:getstarted_maps/data/repository/marker/marker_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerController extends GetxController {
  final MarkerRepository markerRepository;

  MarkerController({required this.markerRepository});

  final _marker = MarkerModel().obs;

  get marker => this._marker.value;
  set marker(value) => this._marker.value = value;

  addMarker(LatLng pos) {
    marker = markerRepository.addMarker(pos);
  }
}
