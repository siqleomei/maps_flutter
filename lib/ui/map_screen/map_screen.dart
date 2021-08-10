import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstarted_maps/controllers/directions/direction_controller.dart';
import 'package:getstarted_maps/controllers/marker/marker_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MarkerController _markerController = Get.find<MarkerController>();
  Set<Marker> _markers = Set();
  Location _location = Location();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-22.950629356169177, -49.896166602260315),
    zoom: 14.5,
  );

  DirectionController _directionController = Get.find<DirectionController>();
  GoogleMapController? _mapController;

  void getAndMoveToCurrentLocal() {
    _location.onLocationChanged.listen((l) {
      _markerController.marker.origin = Marker(
        infoWindow: const InfoWindow(title: "Origin"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        markerId: MarkerId("marker_origin"),
        position: LatLng(l.latitude ?? 0, l.longitude ?? 0),
      );
      setState(() {
        _markers.add(_markerController.marker.origin);
      });
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 14.5),
        ),
      );
    });
  }

  void onMapaCreated(GoogleMapController controller) {
    _mapController = controller;
    getAndMoveToCurrentLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: onMapaCreated,
            markers: _markers,
            onLongPress: (pos) {
              setState(() {
                _markerController.addMarker(pos);
                _directionController.getDirections(
                  origin: _markerController.marker.origin.position,
                  destination: _markerController.marker.destination.position,
                );
              });
            },
            polylines: {
              if (_directionController.info.polylinePoints != null)
                Polyline(
                  polylineId: const PolylineId("overview_polyline"),
                  color: Colors.red,
                  width: 5,
                  points: _directionController.info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
          ),
          if (_directionController.info.totalDistance != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Text(
                  '${_directionController.info.totalDistance}, ${_directionController.info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () {
          var f = _mapController;
          if (f != null) {
            f.animateCamera(
              _directionController.info.bounds != null
                  ? CameraUpdate.newLatLngBounds(
                      _directionController.info.bounds, 100.0)
                  : CameraUpdate.newCameraPosition(_initialCameraPosition),
            );
          }
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
