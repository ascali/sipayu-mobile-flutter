// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllDestinationScreen extends StatefulHookConsumerWidget {
  const AllDestinationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _AllDestinationScreenState();
}

class _AllDestinationScreenState extends ConsumerState<AllDestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Image.asset('assets/icons/wisata.png'),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Wisata",
                  style: GoogleFonts.poly(
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const NetworkImage(
                      "https://i.ibb.co/k15qWF7/photo-1487412720507-e7ab37603c6f-ixlib-rb-4-0.jpg",
                    ),
                  ),
                  title: const Text("Eretan"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("kandanghaur"),
                      Row(
                        children: [
                          const Flexible(
                            child: Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 12,
                            ),
                          ),
                          const Flexible(
                            child: Text(
                              "4.79",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          const Flexible(
                            flex: 3,
                            child: Text(
                              "(78 Ulasan)",
                              style: TextStyle(
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
                              onPressed: () {},
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
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
