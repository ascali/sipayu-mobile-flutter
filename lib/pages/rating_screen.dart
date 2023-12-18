// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/constants/session_constant.dart';
import 'package:sipayu/models/toi_model/data_menu.dart';
import 'package:sipayu/pages/widgets/text_input.dart';
import 'package:sipayu/pods/destination_pod.dart';

class RatingScreen extends StatefulHookConsumerWidget {
  final DataMenu? menu;
  final String idDestiation;
  const RatingScreen({Key? key, this.menu, required this.idDestiation})
      : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerRating = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  double rating = 0;
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Dashboard"),
        actions: [
          TextButton(
            onPressed: () => ref
                .read(destinationPodProvider.notifier)
                .createRating(
                    userId: box.read(SessionConstant.id).toString(),
                    idDestination: widget.idDestiation,
                    title: _controllerTitle.text.trim(),
                    rating: rating,
                    review: _controllerRating.text.trim())
                .then((value) => ref
                    .read(destinationPodProvider.notifier)
                    .getDestination(widget.menu!.id.toString())),
            child: const Text("Post"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Score",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  this.rating = rating;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextInput(
                controller: _controllerTitle,
                // icon: Icons.email_outlined,
                hintText: 'Title',
                borderRadius: 10,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextInput(
                controller: _controllerRating,
                // icon: Icons.email_outlined,
                hintText: 'Review:',
                borderRadius: 10,
                maxLines: 5,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextInput(
                controller: TextEditingController(),
                // icon: Icons.email_outlined,
                hintText: box.read(SessionConstant.username),
                borderRadius: 10,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
