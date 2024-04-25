// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:developer';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sipayu/main.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';
import 'package:sipayu/pods/destination_pod.dart';

class AllMapScreen extends StatefulHookConsumerWidget {
  final DataMenu? menu;
  const AllMapScreen({Key? key, this.menu}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _AllMapScreenState();
}

class _AllMapScreenState extends ConsumerState<AllMapScreen> {
  Location location = Location();
  Completer<GoogleMapController>? controller;
  CameraPosition? cameraPosition;
  List<Marker> _markers = <Marker>[];

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;
  Future initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await location.getLocation().then((value) {
      setState(() {
        _locationData = value;
      });
    });
  }

  Future<void> openMap(double latitude, double longitude) async {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  Future addMarker() async {
    final destinationPod = ref.watch(destinationPodProvider);
    List<DestinationViewModel> list = destinationPod.value
            ?.where((element) => element.id == widget.menu?.id.toString())
            .toList() ??
        [];
    for (var element in list.first.destinations) {
      log(element.id.toString());
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId(element.id.toString()),
            position: LatLng(double.tryParse(element.latitude ?? '0') ?? 0,
                double.tryParse(element.longitude ?? '0') ?? 0),
            infoWindow: InfoWindow(title: element.name ?? '')));
      });
    }
  }

  @override
  void initState() {
    Future.microtask(() => {initLocation(), addMarker()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final destinationPod = ref.watch(destinationPodProvider);
    List<DestinationViewModel> list = destinationPod.value
            ?.where((element) => element.id == widget.menu?.id.toString())
            .toList() ??
        [];

    return Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: _locationData == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Stack(
                children: [
                  if (_locationData != null)
                    Positioned.fill(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        compassEnabled: true,
                        mapToolbarEnabled: true,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.70),
                        initialCameraPosition: CameraPosition(
                          target: LatLng(_locationData?.latitude ?? 0,
                              _locationData?.longitude ?? 0),
                          zoom: 11.4746,
                        ),
                        trafficEnabled: true,
                        markers: Set<Marker>.of(_markers),
                        onMapCreated: (GoogleMapController controller) {},
                      ),
                    ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 20,
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: list.first.destinations.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = {};
                          bool selected = index == 0;
                          var data = list.first.destinations[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: '$urlImage${data.image!}',
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 100,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name ?? '',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 140,
                                      child: Row(
                                        children: [
                                          const Flexible(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 12,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              data.rating.toString(),
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 2.0,
                                          ),
                                          Flexible(
                                            flex: 3,
                                            child: Text(
                                              "(${data.review} Ulasan)",
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          InkWell(
                                              onTap: () => openMap(
                                                  double.tryParse(
                                                          data.latitude ??
                                                              '0') ??
                                                      0,
                                                  double.tryParse(
                                                          data.longitude ??
                                                              '0') ??
                                                      0),
                                              child: Image.asset(
                                                  'assets/icons/route.png'))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ));
  }
}
