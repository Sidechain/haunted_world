import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Center(
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(51.509364, -0.128928), // Set a center point
            initialZoom: 9.2, // Set initial zoom level
            minZoom: 3,
            maxZoom: 18,
            interactionOptions: InteractionOptions(
              flags: InteractiveFlag.all, // Enable all interactions
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            const MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(51.509364, -0.128928),
                  child: Icon(Icons.location_pin, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
