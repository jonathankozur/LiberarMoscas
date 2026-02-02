import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapaPrincipal extends StatelessWidget {
  const MapaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(40.4167, -3.7033),
        initialZoom: 13.0,
        onTap: (tapPosition, point) {
          debugPrint('Tap at: ${point.latitude}, ${point.longitude}');
          _showCoordinates(context, point);
        },
        onLongPress: (tapPosition, point) {
          debugPrint('Long press at: ${point.latitude}, ${point.longitude}');
          _showCoordinates(context, point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.liberar_app',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(
                Uri.parse('https://www.openstreetmap.org/copyright'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showCoordinates(BuildContext context, LatLng point) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Coordenadas: ${point.latitude.toStringAsFixed(6)}, ${point.longitude.toStringAsFixed(6)}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
