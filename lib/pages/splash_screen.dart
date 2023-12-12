import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/login_screen.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future init() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(const LoginScreen());
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/splash.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Jelajahi Tujuan Wisata Menarik Di Wilayah Indramayu',
                  style: GoogleFonts.philosopher(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Buat Rencana Perjalanan Pribadi Anda Sendiri',
                  style: GoogleFonts.philosopher(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Image.asset('assets/images/logo.png')),
                    Flexible(child: Image.asset('assets/images/sipayu.png')),
                  ],
                ),
                Image.asset('assets/images/text.png'),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Text(
        'Powered by\nGincu Media Telematika',
        style: GoogleFonts.philosopher(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
