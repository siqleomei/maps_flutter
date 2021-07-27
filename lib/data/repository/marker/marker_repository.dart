import 'package:getstarted_maps/data/provider/marker/marker_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerRepository {
  ApiMarker apiMarker;

  MarkerRepository({required this.apiMarker});

  addMarker(LatLng pos){
    apiMarker.addMarker(pos);
  }
}