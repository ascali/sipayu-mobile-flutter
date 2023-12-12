// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_screen.dart';

class DetailDestination extends StatefulHookConsumerWidget {
  const DetailDestination({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _DetailDestinationState();
}

class _DetailDestinationState extends ConsumerState<DetailDestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.network(
            'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80',
            fit: BoxFit.fill,
          )),
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
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: DraggableScrollableSheet(
                expand: true,
                minChildSize: 0.45,
                initialChildSize: 0.45,
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
                            'Pantai BALI',
                            style: GoogleFonts.andika(fontSize: 42),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "4.79",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      "(78 Ulasan)",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: TextButton(
                                  onPressed: () {},
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
                                        Get.offAll(const MainScreen()),
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
                                    onPressed: () =>
                                        Get.offAll(const MainScreen()),
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
