import 'package:getstarted_maps/data/model/marker/marker_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiMarker {
  MarkerModel _markerModel;

  ApiMarker({MarkerModel? markerModel})
      : _markerModel = markerModel ?? MarkerModel();

  MarkerModel addMarker(LatLng pos) {
    if (_markerModel.origin == null ||
        (_markerModel.origin != null && _markerModel.destination != null)) {
      _markerModel.origin = Marker(
        markerId: const MarkerId("Origin"),
        infoWindow: const InfoWindow(title: "Origin"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos,
      );

      _markerModel.destination = null;
    } else {
      _markerModel.destination = Marker(
        markerId: const MarkerId("Destination"),
        infoWindow: const InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
    }

    return _markerModel;
  }
}
