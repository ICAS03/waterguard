import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth.dart';
import 'package:waterguard/models/realflood_model.dart';
import 'package:waterguard/models/user_model.dart';
import 'package:waterguard/providers/realtimeflood_provider.dart';
import 'package:waterguard/providers/update_flood_provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/widgets/menu_card.dart';

class mapCard extends StatefulWidget {
  const mapCard({super.key});

  @override
  State<mapCard> createState() => _mapCardState();
}

class _mapCardState extends State<mapCard> {
  //final Map<String, Marker> _floodmarker = {};
  bool _isLoading = true;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late GoogleMapController newGoogleMapController;

  static const CameraPosition _currentLoc = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43021151789838, -122.08264316427048),
      zoom: 15.0);

  //Gettign the user current location//
  late bool servicePermission = false;
  late LocationPermission permission;

  Future<Position> getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

//Convert latlng to location//
  late String place = "";
  Future<String> _getAddressFromCoordinates(position) async {
    if (position == null) {
      return ""; // Return empty string if position is null
    }
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      return "${place.locality}, ${place.country}";
    } catch (e) {
      print("Error getting address: $e");
      return ""; // Return empty string on error
    }
  }

//Set Markers//
  Set<Marker> _markers = {};
  Future<void> _setFloodMarkers(int flood_waterlevel) async {
    const flood = 70;
    const high = 75;
    const medium = 80;
    const low = 94;
    Position position = await getCurrentLocation();
    LatLng currentPosition = LatLng(position.latitude, position.longitude);
    String markerAssetPath;

    if (flood_waterlevel <= flood) {
      print("flood");
      markerAssetPath = 'lib/assets/images/red_dot.png';
    } else if (flood_waterlevel >= flood && flood_waterlevel <= high) {
      print("high");
      markerAssetPath = 'lib/assets/images/yellow_dot.png';
    } else if (flood_waterlevel >= high && flood_waterlevel < medium) {
      print("medium");
      markerAssetPath = 'lib/assets/images/blue_dot.png';
    } else if (flood_waterlevel >= medium && flood_waterlevel <= low) {
      print("low");
      markerAssetPath = 'lib/assets/images/blue_dot.png';
    } else {
      print("very low");
      markerAssetPath = 'lib/assets/images/green_dot.png';
    }

    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), markerAssetPath);

    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId('flood_id'),
        position: LatLng(position.latitude, position.longitude),
        icon: markerIcon));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    var _waterlevel_provider =
        Provider.of<realtimeflood_provider>(context, listen: false);
    _waterlevel_provider.listenToRealTimeFlood();
  }

  @override
  Widget build(BuildContext context) {
    var _updateFloodProvider =
        Provider.of<UpdateFloodProvider>(context, listen: false);
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ;
    return Consumer<realtimeflood_provider>(
        builder: (context, _realtimeflood_provider, _) {
      _setFloodMarkers(_realtimeflood_provider.water_level);
      return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _currentLoc,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          newGoogleMapController = controller;
          // Change to current user location//
          Position position = await getCurrentLocation();
          newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));
          place = await _getAddressFromCoordinates(position);

          setState(() {
            int waterlevel = _realtimeflood_provider.water_level;
            _updateFloodProvider.setFloodData(
                currentUser.id, currentUser.name, waterlevel, place);
          });
        },
        markers: _markers,
      );
    });
  }
}
