// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sipayu/main.dart';

import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';
import 'package:sipayu/pages/all_map_screen.dart';
import 'package:sipayu/pages/review_screen.dart';
import 'package:sipayu/pages/route_destination_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main_screen.dart';

class DetailDestination extends StatefulHookConsumerWidget {
  final DataDestination data;
  final DataMenu? menu;
const DetailDestination({
    Key? key,
    required this.data,
    this.menu,
  }) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _DetailDestinationState();
}

class _DetailDestinationState extends ConsumerState<DetailDestination> {
  Future<void> openMap(double latitude, double longitude) async {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: '$urlImage${widget.data.image}',
            ),
          ),
          Positioned(
              top: 30,
              left: 16,
              child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
          Positioned(
            bottom: -10,
            left: -10,
            right: -10,
            top: 0,
            child: DraggableScrollableSheet(
                expand: true,
                minChildSize: 0.4,
                maxChildSize: 1,
                initialChildSize: 0.4,
                builder: (context, scrollController) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(
                        controller: scrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 10.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          Text(
                            widget.data.name ?? '',
                            style: GoogleFonts.andika(fontSize: 42),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            widget.data.description ?? '',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      (widget.data.rating ?? 0).toString(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      "(${(widget.data.review ?? 0).toString()} Ulasan)",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: TextButton(
                                  onPressed: () => Get.to(ReviewScreen(
                                    dataDestination: widget.data,
                                  )),
                                  child: const Text(
                                    "Lihat Ulasan",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 54,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Get.to(RouteDestinationScreen(
                                      data: widget.data,
                                      menu: widget.menu,
                                    )),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.white,
                                      textStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: const Text(
                                      "Lihat Rute",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 54,
                                  child: ElevatedButton(
                                    onPressed: () => Get.to(AllMapScreen(
                                      menu: widget.menu,
                                    )),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      textStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: const Text(
                                      "Lihat Lainnya",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
