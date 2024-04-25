// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';

import 'main_screen.dart';
import 'package:flutter/material.dart';

var GOOGLE_MAP_API = 'AIzaSyCohTmCm2QtIIjMJfCg_th2q2swUmDhUBs';

class RouteDestinationScreen extends StatefulHookConsumerWidget {
  final DataDestination data;
  final DataMenu? menu;
  const RouteDestinationScreen({
    Key? key,
    required this.data,
    this.menu,
  }) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _RouteDestinationScreenState();
}

class _RouteDestinationScreenState
    extends ConsumerState<RouteDestinationScreen> {
  Location location = Location();
  CameraPosition? cameraPosition;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((coordinates) => {
              generatePolyLineFromPoints(coordinates),
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  compassEnabled: true,
                  mapToolbarEnabled: true,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(40.683337, -73.940432),
                    zoom: 6.4746,
                  ),
                  // myLocationButtonEnabled: true,
                  // liteModeEnabled: true,
                  trafficEnabled: true,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.80),
                  polylines: Set<Polyline>.of(polylines.values),
                  markers: {
                    Marker(
                      markerId: const MarkerId("_currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _currentP!,
                      infoWindow: const InfoWindow(
                        title: 'Asal',
                      ),
                    ),
                    Marker(
                        markerId: const MarkerId("_sourceLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        infoWindow: InfoWindow(
                          title: 'Tujuan ${widget.data.name}',
                        ),
                        position: LatLng(
                            double.tryParse(widget.data.latitude ?? '0') ?? 0,
                            double.tryParse(widget.data.longitude ?? '0') ??
                                0)),
                  },
                  onMapCreated: (GoogleMapController c) =>
                      _mapController.complete(c),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          LatLng destination = LatLng(
                              double.tryParse(widget.data.latitude ?? '0') ?? 0,
                              double.tryParse(widget.data.longitude ?? '0') ??
                                  0);
                          MapsLauncher.launchCoordinates(
                              destination.latitude, destination.longitude);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          textStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        child: const Text(
                          "Navigasi Ke Google Maps",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition =
        CameraPosition(target: pos, zoom: 11, bearing: 20);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await location.requestService();
    } else {
      return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    await location.getLocation().then((value) {
      if (value.latitude != null && value.longitude != null) {
        setState(() {
          _currentP = LatLng(value.latitude!, value.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    LatLng destination = LatLng(
        double.tryParse(widget.data.latitude ?? '0') ?? 0,
        double.tryParse(widget.data.longitude ?? '0') ?? 0);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAP_API,
      PointLatLng(_currentP?.latitude ?? 0, _currentP?.longitude ?? 0),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
