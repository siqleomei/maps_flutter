import 'package:dio/dio.dart';
import 'package:getstarted_maps/data/.env.dart';
import 'package:getstarted_maps/data/model/directions/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiDirections {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  ApiDirections({Dio? dio}) : _dio = dio ?? Dio();

  Future<ModelDirections?> getDirections({ required LatLng origin, required LatLng destination}) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleApiKey,
      },
    );

    return response.statusCode == 200 ? ModelDirections.fromMap(response.data) : null;
  }
}