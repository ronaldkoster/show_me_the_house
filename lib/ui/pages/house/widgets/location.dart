import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../domain/coordinates.dart';

class Location extends StatelessWidget {
  final double _markersSize = 80;
  final Coordinates _coordinates;
  final double _height;
  final double _zoom;

  const Location(
      {Key? key,
      required Coordinates coordinates,
      required double height,
      required double zoom})
      : _coordinates = coordinates,
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
            _coordinates.latitude,
            _coordinates.longitude,
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
                  _coordinates.latitude,
                  _coordinates.longitude,
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
