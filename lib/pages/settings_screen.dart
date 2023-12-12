// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/edit_profile.dart';
import 'package:sipayu/utils/text_style.dart';

class SettingScreen extends StatefulHookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Selamat Pagi",
            style: TextStyleCustom.bold400(),
          ),
          Text(
            "Hallo, Ascaliko",
            style: TextStyleCustom.bold600(size: 26),
          ),
          Text(
            "Profile",
            style: TextStyleCustom.bold500(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          "Pesta Laut | Pantai Eretan",
                          style: TextStyleCustom.bold500(
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.network(
                        "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Log Out",
                          style: GoogleFonts.poly(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () => Get.to(const EditProfileScreen()),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Edit",
                          style: GoogleFonts.poly(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            "History",
            style: TextStyleCustom.bold500(
              size: 18,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    Positioned(
                      top: 20,
                      child: SizedBox(
                        width: Get.width * 0.2,
                        child: Text(
                          '12:30 WIB',
                          style: TextStyleCustom.bold400(size: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 17, 10, 30),
                      child: Row(
                        children: [
                          SizedBox(width: Get.width * 0.1),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pesta Laut',
                                  style: TextStyleCustom.bold600(),
                                ),
                                Text('01 Desember 2023',
                                    style: TextStyleCustom.bold400(size: 16))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.route_sharp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 80,
                      child: Container(
                        height: Get.height * 0.7,
                        width: 1.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 28,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.location_on_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
