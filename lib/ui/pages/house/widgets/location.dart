import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Location extends StatelessWidget {
  final double _markersSize = 80;
  final double _latitude;
  final double _longitude;
  final double _height;
  final double _zoom;

  const Location(
      {Key? key,
      required double latitude,
      required double longitude,
      required double height,
      required double zoom})
      : _latitude = latitude,
        _longitude = longitude,
        _height = height,
        _zoom = zoom,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: FlutterMap(
        options: MapOptions(
          allowPanning: false,
          center: LatLng(
            _latitude,
            _longitude,
          ),
          zoom: _zoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: _markersSize,
                height: _markersSize,
                point: LatLng(
                  _latitude,
                  _longitude,
                ),
                builder: (_) => const Icon(Icons.location_pin),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
