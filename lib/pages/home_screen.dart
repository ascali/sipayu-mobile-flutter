import 'dart:convert';
import 'dart:developer';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/all_destination.dart';
import 'package:sipayu/pages/detail_destination.dart';
import 'package:sipayu/pages/event_screen.dart';
import 'package:sipayu/pods/ads_pod.dart';
import 'package:sipayu/pods/destination_pod.dart';
import 'package:sipayu/pods/ebrosure_pod.dart';
import 'package:sipayu/pods/menu_pod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final CarouselController _controller = CarouselController();
  final CarouselController _controllerAds = CarouselController();
  int _current = 0;
  int _currentAds = 0;
  @override
  void initState() {
    Future.microtask(() {
      ref.read(menuPodProvider.notifier).getDataMenu();
      ref.read(adsPodProvider.notifier).getDataAds();
      ref.read(eBrosurePodProvider.notifier).getBrosure();
      ref.read(destinationPodProvider.notifier).getDestination('1');
    });
    super.initState();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pod = ref.watch(menuPodProvider);
    final adsPod = ref.watch(adsPodProvider);
    final brosurePod = ref.watch(eBrosurePodProvider);
    final destinationPod = ref.watch(destinationPodProvider);
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height + 120,
          child: Stack(
            children: [
              Positioned(
                  left: -10,
                  right: -10,
                  top: -16,
                  child: adsPod.when(
                      data: (data) {
                        if (data?.isEmpty == true) {
                          return Image.asset('assets/images/bg_home.png');
                        }
                        return Stack(
                          children: [
                            CarouselSlider(
                              items: data!
                                  .map<Widget>((item) => InkWell(
                                        onTap: () => _launchUrl(item.url ?? ''),
                                        child: Container(
                                          margin: const EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5.0)),
                                              child: Stack(
                                                children: <Widget>[
                                                  CachedMemoryImage(
                                                    uniqueKey:
                                                        item.name.toString(),
                                                    base64: item.image!
                                                        .split(',')
                                                        .last,
                                                    width: 2000,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ))
                                  .toList(),
                              carouselController: _controllerAds,
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: false,
                                  viewportFraction: 1.0,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 500),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentAds = index;
                                    });
                                  }),
                            ),
                            Positioned(
                                top: 80,
                                left: 30,
                                child: InkWell(
                                  onTap: () => _controllerAds.previousPage(),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: const Icon(Icons.arrow_back_ios,
                                        size: 15, weight: 20),
                                  ),
                                )),
                            Positioned(
                                top: 80,
                                right: 30,
                                child: InkWell(
                                  onTap: () => _controllerAds.nextPage(),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      weight: 20,
                                    ),
                                  ),
                                )),
                            Positioned(
                                bottom: 60,
                                left: 30,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sikat Promonya Sekarang",
                                          style: GoogleFonts.poly(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 2, 8, 0),
                                          child: Image.asset(
                                            'assets/icons/arrow.png',
                                            scale: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/icons/ads.png',
                                      scale: 1,
                                    )
                                  ],
                                ))
                          ],
                        );
                      },
                      error: (e, error) => Center(
                            child: Text(error.toString()),
                          ),
                      loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ))),
              Positioned(
                top: 160,
                left: 16,
                right: 16,
                child: Card(
                  elevation: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                height: 18,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Image.asset(
                                'assets/images/sipayu.png',
                                height: 15,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Image.asset(
                                'assets/images/imkot.png',
                                height: 26,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: pod.when(
                              data: (data) {
                                return GridView.count(
                                    crossAxisCount: 3,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    // ignore: prefer_const_constructors
                                    physics: NeverScrollableScrollPhysics(),
                                    children: List.generate(
                                      data!.length,
                                      (index) {
                                        return InkWell(
                                          onTap: () =>
                                              data[index].name?.toLowerCase() ==
                                                      'event'
                                                  ? Get.to(const EventScreen())
                                                  : Get.to(AllDestinationScreen(
                                                      menu: data[index],
                                                    )),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.red
                                                      .withOpacity(0.3),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            margin: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CachedMemoryImage(
                                                  uniqueKey: data[index]
                                                      .name
                                                      .toString(),
                                                  base64: data[index]
                                                      .image!
                                                      .split(',')
                                                      .last,
                                                  height: 50,
                                                ),
                                                Text(
                                                  data[index].name ?? '',
                                                  style: GoogleFonts.poly(
                                                    fontSize: 12,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ));
                              },
                              error: (e, stackTrace) => Text(e.toString()),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 420,
                left: 16,
                right: 16,
                // bottom: 10,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "e-Brosure",
                          style: GoogleFonts.poly(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    brosurePod.when(
                        data: (data) {
                          if (data?.isEmpty == true) {
                            return Container();
                          }
                          return CarouselSlider(
                            items: data!
                                .map<Widget>((item) => Container(
                                      margin: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              CachedMemoryImage(
                                                uniqueKey: item.name.toString(),
                                                base64:
                                                    item.image!.split(',').last,
                                                width: 1000,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                bottom: 0.0,
                                                left: 0.0,
                                                right: 0.0,
                                                child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              200, 0, 0, 0),
                                                          Color.fromARGB(
                                                              0, 0, 0, 0)
                                                        ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: imgList
                                                          .asMap()
                                                          .entries
                                                          .map((entry) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              _controller
                                                                  .animateToPage(
                                                                      entry
                                                                          .key),
                                                          child: Container(
                                                            width: 12.0,
                                                            height: 12.0,
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        4.0),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: (Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .white)
                                                                    .withOpacity(_current ==
                                                                            entry.key
                                                                        ? 0.9
                                                                        : 0.4)),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ))
                                .toList(),
                            carouselController: _controller,
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: false,
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          );
                        },
                        error: (e, error) => Center(
                              child: Text(error.toString()),
                            ),
                        loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Destinasi Popular",
                          style: GoogleFonts.poly(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.to(AllDestinationScreen(
                            menu: ref
                                .read(menuPodProvider)
                                .value
                                ?.where((element) =>
                                    element.name?.toLowerCase() == 'wisata')
                                .toList()
                                .first,
                          )),
                          child: Text(
                            "Lihat Semua",
                            style: GoogleFonts.poly(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    destinationPod.when(
                        data: (data) {
                          if (data?.any((element) => element.id == '1') ==
                              true) {
                            List<DestinationViewModel> list = data
                                    ?.where((element) => element.id == '1')
                                    .toList() ??
                                [];
                            if (list.first.destinations.isEmpty) {
                              return Container();
                            }

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: ScrollController(),
                              child: Row(
                                children: List.generate(
                                  list.first.destinations.length,
                                  (index) {
                                    var destination =
                                        list.first.destinations[index];
                                    var item = {};
                                    bool selected = index == 0;

                                    return InkWell(
                                      onTap: () => Get.to(DetailDestination(
                                        data: destination,
                                      )),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 10.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: 160,
                                          height: 160,
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedMemoryImageProvider(
                                                destination.id.toString(),
                                                bytes: base64Decode(destination
                                                    .image!
                                                    .split(',')
                                                    .last),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16.0),
                                            ),
                                            color: Colors.blue[400],
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                top: 10,
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(16.0),
                                                      bottomRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        destination.name ?? '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.andika(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        destination
                                                                .description ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                        error: (s, e) => Text(e.toString()),
                        loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
