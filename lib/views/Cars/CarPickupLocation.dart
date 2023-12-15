import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../models/Car.dart';
import 'CarDetailInformation.dart';

class CarPickupLocation extends StatefulWidget {
  const CarPickupLocation({Key? key, required this.car}) : super(key: key);
  final Car car;

  @override
  _CarPickupLocationState createState() {
    return _CarPickupLocationState();
  }
}

class _CarPickupLocationState extends State<CarPickupLocation> {
  final Completer<GoogleMapController> _controllerGoogleMap =
  Completer<GoogleMapController>();
  late GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latlng = [
    const LatLng(33.730889, 73.08443439),
    const LatLng(33.750889, 72.63043439),
  ];

  @override
  void initState() {
    super.initState();
    _polyline.add(
      Polyline(
        polylineId: const PolylineId('1'),
        points: [],
        color: Colors.orange,
      ),
    );

    for (int i = 0; i < latlng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: const InfoWindow(
            title: 'Really cool place',
            snippet: '5 star rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    // Initialize map with markers and polyline
    locatePosition();
  }

  Future<void> locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    LatLng destinationLatLng = latlng.last;

    setState(() {
      _polyline.add(
        Polyline(
          polylineId: const PolylineId('1'),
          points: [currentLatLng, destinationLatLng],
          color: Colors.orange,
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: currentLatLng,
          infoWindow: const InfoWindow(
            title: 'Current Location',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });

    CameraPosition cameraPosition = CameraPosition(target: currentLatLng, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newLatLng(currentLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                bottomPaddingOfMap = 265.0;
              });
            },
            polylines: _polyline,
            markers: _markers,
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Stack(
              children: [
                CarDetailsInformation(car: widget.car),
                Positioned(
                  right: 40,
                  top: 50,
                  width: 100,
                  height: 60,
                  child: Image.network(
                    widget.car.images[0].getImageUrl(),
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
