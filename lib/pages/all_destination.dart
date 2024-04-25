// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sipayu/constants/session_constant.dart';
import 'package:sipayu/main.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';
import 'package:sipayu/pages/detail_destination.dart';
import 'package:sipayu/pages/login_screen.dart';
import 'package:sipayu/pages/rating_screen.dart';
import 'package:sipayu/pods/destination_pod.dart';

class AllDestinationScreen extends StatefulHookConsumerWidget {
  final DataMenu? menu;
  const AllDestinationScreen({
    Key? key,
    this.menu,
  }) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _AllDestinationScreenState();
}

class _AllDestinationScreenState extends ConsumerState<AllDestinationScreen> {
  bool isLoading = true;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;

  void onRefresh() {
    ref
        .read(destinationPodProvider.notifier)
        .getDestination(widget.menu!.id.toString())
        .then((value) {
      _refreshController.refreshCompleted();
      page = 2;
    });
  }

  @override
  void initState() {
    Future.microtask(() {
      log(widget.menu!.id.toString(), name: 'id s');
      isLoading = true;
      ref
          .read(destinationPodProvider.notifier)
          .getDestination(widget.menu!.id.toString())
          .then((value) {
        setState(() {
          isLoading = false;
          page++;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final destinationPod = ref.watch(destinationPodProvider);
    return Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  CachedMemoryImage(
                    uniqueKey: widget.menu!.name.toString(),
                    base64: widget.menu!.image!.split(',').last,
                    scale: 1.2,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    widget.menu?.name ?? '',
                    style: GoogleFonts.poly(
                      fontWeight: FontWeight.w400,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              destinationPod.when(
                data: (data) {
                  if (data?.any((element) =>
                          element.id == widget.menu?.id.toString()) ==
                      true) {
                    List<DestinationViewModel> list = data
                            ?.where((element) =>
                                element.id == widget.menu?.id.toString())
                            .toList() ??
                        [];
                    if (list.first.destinations.isEmpty) {
                      return Container();
                    }
                    if (isLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    return Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        header: const WaterDropHeader(),
                        controller: _refreshController,
                        onRefresh: () => onRefresh(),
                        onLoading: () => ref
                            .read(destinationPodProvider.notifier)
                            .getDestinationOnloading(
                                (widget.menu?.id ?? 0).toString(),
                                page: page)
                            .then((value) {
                          setState(() {
                            _refreshController.loadComplete();
                            page++;
                          });
                        }),
                        child: ListView.separated(
                          itemCount: list.first.destinations.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            var destination = list.first.destinations[index];
                            return ListTile(
                              onTap: () => Get.to(DetailDestination(
                                data: destination,
                                menu: widget.menu,
                              )),
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: CachedNetworkImageProvider(
                                  '$urlImage${destination.image}',
                                ),
                              ),
                              title: Text(destination.name ?? ''),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(destination.location ?? ''),
                                  Row(
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
                                          destination.rating.toString(),
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
                                          "(${destination.review} Ulasan)",
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Flexible(
                                        flex: 4,
                                        child: TextButton(
                                          onPressed: () {
                                            GetStorage session = GetStorage();
                                            if (session
                                                .hasData(SessionConstant.id)) {
                                              Get.to(RatingScreen(
                                                menu: widget.menu,
                                                idDestiation:
                                                    destination.id.toString(),
                                              ));
                                              return;
                                            }
                                            Get.to(const LoginScreen());
                                          },
                                          child: const Text(
                                            "Beri Ulasan",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.red,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Get.to(DetailDestination(
                                    data: destination,
                                    menu: widget.menu,
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Container();
                },
                error: (s, e) => Text(e.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ],
          ),
        ));
  }
}
