// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/models/destination_model/data_destination.dart';
import 'package:sipayu/pages/widgets/progress_bar.dart';

class ReviewScreen extends StatefulHookConsumerWidget {
  final DataDestination dataDestination;
  const ReviewScreen({Key? key, required this.dataDestination})
      : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
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
              const Text(
                "Ringkasan",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            SizedBox(
                              width: 200,
                              child: ProgressBarWidget(
                                countReview: 3,
                                totalReview: 3,
                                height: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            SizedBox(
                              width: 200,
                              child: ProgressBarWidget(
                                countReview: 3,
                                totalReview: 8,
                                height: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            SizedBox(
                              width: 200,
                              child: ProgressBarWidget(
                                countReview: 3,
                                totalReview: 12,
                                height: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            SizedBox(
                              width: 200,
                              child: ProgressBarWidget(
                                countReview: 3,
                                totalReview: 25,
                                height: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            SizedBox(
                              width: 200,
                              child: ProgressBarWidget(
                                countReview: 3,
                                totalReview: 35,
                                height: 10,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Flexible(
                    flex: 2,
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
                                "4.5",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          Text(
                            "(256) Ulasan",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: const BorderSide(color: Colors.grey)))),
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
              ListTile(
                // dense: true,
                isThreeLine: true,

                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/PGv8ZzG/me.jpg",
                  ),
                ),
                title: const Text("John doe"),
                subtitle: const Text(
                    "MANTAP Gan\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                trailing: RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
