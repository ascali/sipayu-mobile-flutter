// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/models/rating_model/rating_model.dart';
import 'package:sipayu/pages/widgets/progress_bar.dart';
import 'package:sipayu/pods/destination_pod.dart';

class ReviewScreen extends StatefulHookConsumerWidget {
  final DataDestination dataDestination;
  const ReviewScreen({Key? key, required this.dataDestination})
      : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  RatingModel? ratingModel;
  bool isLoading = true;

  @override
  void initState() {
    Future.microtask(() {
      ref
          .read(destinationPodProvider.notifier)
          .getReview((1).toString())
          .then((value) {
        setState(() {
          isLoading = false;
          ratingModel = value;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Rating dan Ulasan (${widget.dataDestination.review})",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              if (isLoading == false &&
                  ratingModel?.data?.stars?.isEmpty == true)
                const Center(
                  child: Text(
                    "Belum ada Ulasan",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              if (isLoading == false &&
                  ratingModel?.data?.stars?.isEmpty == false) ...{
                const Text(
                  "Ringkasan",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProgressBarWidget(
                                  countReview:
                                      ratingModel?.data?.stars?.first.star5 ??
                                          0,
                                  totalReview: ((ratingModel
                                              ?.data?.stars?.first.star5 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star2 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          3) +
                                      (ratingModel?.data?.stars?.first.star4 ??
                                          0)),
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "4",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProgressBarWidget(
                                  countReview:
                                      ratingModel?.data?.stars?.first.star4 ??
                                          0,
                                  totalReview: ((ratingModel
                                              ?.data?.stars?.first.star5 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star2 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          3) +
                                      (ratingModel?.data?.stars?.first.star4 ??
                                          0)),
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProgressBarWidget(
                                  countReview:
                                      ratingModel?.data?.stars?.first.star3 ??
                                          0,
                                  totalReview: ((ratingModel
                                              ?.data?.stars?.first.star5 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star2 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          3) +
                                      (ratingModel?.data?.stars?.first.star4 ??
                                          0)),
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProgressBarWidget(
                                  countReview:
                                      ratingModel?.data?.stars?.first.star4 ??
                                          2,
                                  totalReview: ((ratingModel
                                              ?.data?.stars?.first.star5 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star2 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          3) +
                                      (ratingModel?.data?.stars?.first.star4 ??
                                          0)),
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: ProgressBarWidget(
                                  countReview:
                                      ratingModel?.data?.stars?.first.star1 ??
                                          0,
                                  totalReview: ((ratingModel
                                              ?.data?.stars?.first.star5 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star2 ??
                                          0) +
                                      (ratingModel?.data?.stars?.first.star1 ??
                                          3) +
                                      (ratingModel?.data?.stars?.first.star4 ??
                                          0)),
                                  height: 10,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ratingModel?.data?.rating?.first.toString() ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            Text(
                              "(${ratingModel?.data?.reviews?.length}) Ulasan",
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "88%",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                              ],
                            ),
                            Text(
                              "Rekomendasi",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                    child: const Text(
                      "Tulis ulasan anda",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Location reviews are managed by a third party to verify authenticity and compliance with our Ratings & Reviews Guidelines",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                  child: Text(
                    "Ulasan Lokasi Saat ini",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ...ratingModel!.data!.reviews!
                    .map(
                      (e) => ListTile(
                        // dense: true,
                        isThreeLine: true,

                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            e.image ?? '',
                          ),
                        ),
                        title: Text(e.name ?? ''),
                        subtitle: Text(e.review ?? ''),
                        trailing: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          // allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    )
                    .toList()
              }
            ],
          ),
        ),
      ),
    );
  }
}
