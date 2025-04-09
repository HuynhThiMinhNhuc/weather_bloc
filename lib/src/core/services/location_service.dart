import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  /// Check and request location permissions
  Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return true;
  }

  /// Get current position (latitude & longitude)
  Future<Position> getCurrentPosition() async {
    await _handlePermission();

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// Reverse geocode to get city name
  Future<String> getCityFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return place.locality?.isNotEmpty == true
            ? place.locality!
            : 'Unknown city';
      }
    } catch (e) {
      rethrow;
    }
    return 'Unknown city';
  }

  /// Combined method: Get location info (lat, long, city)
  Future<LocationResult> getLocationInfo() async {
    final position = await getCurrentPosition();
    final city = await getCityFromCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    return LocationResult(
      latitude: position.latitude,
      longitude: position.longitude,
      city: city,
    );
  }
}

class LocationResult {
  final double latitude;
  final double longitude;
  final String city;

  LocationResult({
    required this.latitude,
    required this.longitude,
    required this.city,
  });

  @override
  String toString() => 'Lat: $latitude, Long: $longitude, City: $city';
}
