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

import 'package:latlong2/latlong.dart' as latlong;
import 'package:apple_maps_flutter/apple_maps_flutter.dart' as apple_maps;
import 'package:quicky/flutter_flow/lat_lng.dart' as ff_latlng;

class AppleMapView extends StatefulWidget {
  const AppleMapView({
    Key? key,
    required this.userSet, // Coordenadas do usuário
    required this.width,
    required this.height,
    this.zoom = 15.0, // Nível de zoom padrão
  }) : super(key: key);

  final ff_latlng.LatLng userSet; // Tipo de LatLng de flutter_flow
  final double zoom; // Nível de zoom
  final double width; // Largura do mapa
  final double height; // Altura do mapa

  @override
  _AppleMapViewState createState() => _AppleMapViewState();
}

class _AppleMapViewState extends State<AppleMapView> {
  // Função para converter LatLng de flutter_flow para latlong2
  latlong.LatLng convertFFToLatLng(ff_latlng.LatLng latLng) {
    return latlong.LatLng(latLng.latitude, latLng.longitude);
  }

  // Função para converter LatLng de latlong2 para apple_maps
  apple_maps.LatLng convertToAppleMapLatLng(latlong.LatLng latLng) {
    return apple_maps.LatLng(latLng.latitude, latLng.longitude);
  }

  @override
  Widget build(BuildContext context) {
    // Converte o latLng de flutter_flow para latlong2 e então para apple_maps
    final latlongLatLng = convertFFToLatLng(widget.userSet);
    final target = convertToAppleMapLatLng(latlongLatLng);

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: apple_maps.AppleMap(
        initialCameraPosition: apple_maps.CameraPosition(
          target: target, // Centraliza no local definido
          zoom: widget.zoom, // Define o nível de zoom
        ),
        annotations: {
          apple_maps.Annotation(
            annotationId: apple_maps.AnnotationId('user-location'),
            position: target,
            infoWindow: const apple_maps.InfoWindow(title: 'Local Selecionado'),
          ),
        },
        onMapCreated: (_) {},
        onTap: (_) {},
      ),
    );
  }
}
