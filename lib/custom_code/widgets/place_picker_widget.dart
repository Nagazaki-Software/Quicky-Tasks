// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/flutter_flow/lat_lng.dart' as ff_latlng;

// Função de conversão: latlong2.LatLng -> flutter_flow.LatLng
ff_latlng.LatLng convertLatLngToFF(latlong.LatLng latLng) {
  return ff_latlng.LatLng(latLng.latitude, latLng.longitude);
}

// Função de conversão: flutter_flow.LatLng -> latlong2.LatLng
latlong.LatLng convertFFToLatLng(ff_latlng.LatLng latLng) {
  return latlong.LatLng(latLng.latitude, latLng.longitude);
}

class PlacePickerWidget extends StatefulWidget {
  const PlacePickerWidget({
    Key? key,
    this.initialZoom = 11,
    this.minZoomLevel = 5,
    this.maxZoomLevel = 16,
    required this.width,
    required this.height,
    this.onPlacePicked,
  }) : super(key: key);

  final double initialZoom;
  final double minZoomLevel;
  final double maxZoomLevel;
  final double width;
  final double height;

  final Future Function(ff_latlng.LatLng selectedPlace)? onPlacePicked;

  @override
  State<PlacePickerWidget> createState() => _PlacePickerWidgetState();
}

class _PlacePickerWidgetState extends State<PlacePickerWidget> {
  latlong.LatLng? selectedLatLng;
  latlong.LatLng currentLocation =
      latlong.LatLng(-23.5505, -46.6333); // default São Paulo

  final mapController = MapController();
  final TextEditingController searchController = TextEditingController();

  void _onPlacePickedHandler(latlong.LatLng latLng) async {
    setState(() {
      selectedLatLng = latLng;
    });

    if (widget.onPlacePicked != null) {
      // Converte latlong2.LatLng para flutter_flow.LatLng
      final ffLatLng = convertLatLngToFF(latLng);
      await widget.onPlacePicked!(ffLatLng);
    }
  }

  void _centerOnUser() {
    setState(() {
      currentLocation = latlong.LatLng(-23.5505, -46.6333);
      mapController.move(currentLocation, widget.initialZoom);
    });
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;

    final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');

    final response = await http.get(uri, headers: {
      'User-Agent': 'Flutter App', // obrigatório pelo Nominatim
    });

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      if (results.isNotEmpty) {
        final lat = double.parse(results[0]['lat']);
        final lon = double.parse(results[0]['lon']);
        final newLocation = latlong.LatLng(lat, lon);

        setState(() {
          currentLocation = newLocation;
          selectedLatLng = newLocation;
        });

        mapController.move(newLocation, widget.initialZoom);

        if (widget.onPlacePicked != null) {
          // Converte latlong2.LatLng para flutter_flow.LatLng
          final ffLatLng = convertLatLngToFF(newLocation);
          await widget.onPlacePicked!(ffLatLng);
        }
      } else {
        _showSnackbar("Local não encontrado.");
      }
    } else {
      _showSnackbar("Erro ao buscar localização.");
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: currentLocation,
              initialZoom: widget.initialZoom,
              minZoom: widget.minZoomLevel,
              maxZoom: widget.maxZoomLevel,
              onTap: (tapPosition, point) => _onPlacePickedHandler(point),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              if (selectedLatLng != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedLatLng!,
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _centerOnUser,
              child: const Icon(Icons.my_location),
              backgroundColor: Colors.brown,
              mini: true,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.brown),
                  hintText: "Search Location...",
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) => _searchLocation(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
