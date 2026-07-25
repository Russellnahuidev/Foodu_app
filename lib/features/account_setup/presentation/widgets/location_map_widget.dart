import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:latlong2/latlong.dart';

class LocationMapWidget extends StatelessWidget {
  final MapController mapController;
  final LatLng initialPosition;
  final LatLng? selectedLocation;
  final Function(LatLng) onLocationSelected;

  const LocationMapWidget({
    super.key,
    required this.mapController,
    required this.initialPosition,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FlutterMap(
        mapController: mapController,

        options: MapOptions(
          initialCenter: initialPosition,
          initialZoom: 16,

          onTap: (tapPosition, latlng) {
            FocusScope.of(context).unfocus();
            onLocationSelected(latlng);
          },
        ),

        children: [
          // MAPA BASE
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

            userAgentPackageName: 'com.example.foodu_app',
          ),

          // MARCADOR
          if (selectedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: selectedLocation!,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
