import 'dart:developer';

import 'package:flutter/material.dart';

class ProgressBarWidget extends StatefulWidget {
  final int countReview;
  final int totalReview;
  final double? height;
  const ProgressBarWidget(
      {Key? key,
      this.height,
      required this.countReview,
      required this.totalReview})
      : super(key: key);

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  bool isAnimated = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimated = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // setState(() {
    //   isAnimated = false;
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log((MediaQuery.of(context).size.width *
            (widget.countReview / widget.totalReview))
        .toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: widget.height ?? 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: widget.height ?? 5,
                width: isAnimated
                    ? (MediaQuery.of(context).size.width *
                                (widget.countReview / widget.totalReview))
                            .isNaN
                        ? 0
                        : MediaQuery.of(context).size.width *
                            (widget.countReview / widget.totalReview)
                    : 0,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
