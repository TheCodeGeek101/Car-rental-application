import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/Car.dart';
import 'CarDetailInformation.dart';

class CarPickupLocation extends StatefulWidget {
  CarPickupLocation({super.key,required this.car});
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Stack(
        children:[
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled:true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller){
                    _controllerGoogleMap.complete(controller);
                    newGoogleMapController = controller;
              },
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
                  top:50,
                  width:100,
                  height:60,
                  child: Image.network(
                    widget.car.images[0].getImageUrl(),
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ]
      )
    );
  }
}