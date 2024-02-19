import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Map<String, dynamic>> data = [
  {
    'id': "1",
    'position': const LatLng(3.066038466618524, 101.61743234460398),
    'assetPath': 'lib/assets/images/red_dot.png'
  },
  {
    'id': "2",
    'position': const LatLng(3.064096547136472, 101.61465719418023),
    'assetPath': 'lib/assets/images/blue_dot.png'
  },
  {
    'id': "3",
    'position': const LatLng(3.0688962929108285, 101.6164007750196),
    'assetPath': 'lib/assets/images/green_dot.png'
  },
  {
    'id': "4",
    'position': const LatLng(3.0675787177845937, 101.619683733537),
    'assetPath': 'lib/assets/images/yellow_dot.png'
  },
];

class mapCard extends StatefulWidget {
  const mapCard({super.key});

  @override
  State<mapCard> createState() => _mapCardState();
}

class _mapCardState extends State<mapCard> {
  final Map<String, Marker> _floodmarker = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _currentLoc = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(3.064841233348692, 101.61681479351097),
      zoom: 15.0);

  @override
  void initState() {
    _setfloodmarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _currentLoc,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _floodmarker.values.toSet(),
      onTap: (LatLng) => {},
    );
  }

  _setfloodmarker() async {
    for (int i = 0; i < data.length; i++) {
      BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), data[i]['assetPath']);

      _floodmarker[i.toString()] = Marker(
          markerId: MarkerId(i.toString()),
          position: data[i]['position'],
          icon: markerIcon);

      setState(() {});
    }
  }
}
