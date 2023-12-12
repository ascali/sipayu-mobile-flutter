import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/all_destination.dart';
import 'package:sipayu/pages/detail_destination.dart';
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
  int _current = 0;
  @override
  void initState() {
    Future.microtask(() => ref.read(menuPodProvider.notifier).getDataMenu());
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
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height + 120,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.asset('assets/images/bg_home.png')),
              Positioned(
                top: 180,
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
                                          onTap: () => _launchUrl(
                                              data[index].link ?? ''),
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
                                                Image.asset(
                                                  data[index].icons ?? '',
                                                  fit: BoxFit.fill,
                                                ),
                                                Text(
                                                  data[index].title ?? '',
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
                    CarouselSlider(
                      items: imgList
                          .map<Widget>((item) => Container(
                                margin: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(item,
                                            fit: BoxFit.cover, width: 1000.0),
                                        Positioned(
                                          bottom: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: imgList
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  return GestureDetector(
                                                    onTap: () => _controller
                                                        .animateToPage(
                                                            entry.key),
                                                    child: Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0,
                                                          horizontal: 4.0),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: (Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .white)
                                                              .withOpacity(
                                                                  _current ==
                                                                          entry
                                                                              .key
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
                    ),
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
                          onPressed: () => Get.to(AllDestinationScreen()),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(),
                      child: Row(
                        children: List.generate(
                          10,
                          (index) {
                            var item = {};
                            bool selected = index == 0;

                            return InkWell(
                              onTap: () => Get.to(DetailDestination()),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  margin: const EdgeInsets.only(right: 10.0),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
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
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16.0),
                                              bottomRight:
                                                  Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Indramayu",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.andika(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "16 Lokasi",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
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
                    ),
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
