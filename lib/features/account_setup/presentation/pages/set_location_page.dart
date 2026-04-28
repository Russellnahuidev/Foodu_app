import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/location_bottom_panel.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/location_map_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  // Controller del TextField
  final locationController = TextEditingController();

  // Ubicación seleccionada
  LatLng? _selectedLocation;

  // Controlador del mapa
  final MapController _mapController = MapController();

  // Ubicación inicial (Ayacucho ejemplo)
  LatLng _initialPosition = const LatLng(-13.1631, -74.2236);

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  // Obtener ubicación actual
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar GPS
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return;

    // Permisos
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Obtener posición
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng userLocation = LatLng(position.latitude, position.longitude);

    setState(() {
      _selectedLocation = userLocation;
      _initialPosition = userLocation;
    });

    // Mover cámara
    _mapController.move(userLocation, 16);

    // Obtener dirección
    await _getAddressFromLatLng(userLocation);
  }

  // Convertir coordenadas en dirección
  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        locationController.text = "${place.street}, ${place.locality}";
      }
    } catch (e) {
      debugPrint("Error obteniendo dirección: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.setLocationTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          LocationMapWidget(
            mapController: _mapController,
            initialPosition: _initialPosition,
            selectedLocation: _selectedLocation,

            onLocationSelected: (latlng) async {
              setState(() {
                _selectedLocation = latlng;
              });

              await _getAddressFromLatLng(latlng);
            },
          ),

          LocationBottomPanel(
            controller: locationController,

            onUseCurrentLocation: _getCurrentLocation,

            onContinue: () {
              // Navegar a CreatePinPage
              context.push(RoutesNames.createPin);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }
}
