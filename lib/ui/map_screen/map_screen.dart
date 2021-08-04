import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/directions/direction_controller.dart';
import 'package:getstarted_maps/controllers/marker/marker_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends GetView<MarkerController> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-22.950629356169177, -49.896166602260315),
    zoom: 11.5,
  );

  DirectionController? _directionController;
  GoogleMapController? _mapController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<MarkerController>(
          initState: (state) {Get.find<MarkerController>();},
          builder: (_) {
          return GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _mapController = controller,
            markers: {
                if (_.marker.origin != null) _.marker.origin,
                if (_.marker.destination != null) _.marker.destination},
            onLongPress: _.addMarker,
          );},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () {
          var f = _mapController;
          if (f != null) {
            f.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition),
            );
          }
        } ,
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}