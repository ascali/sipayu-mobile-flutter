// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:sipayu/pages/widgets/text_input.dart';
import 'package:sipayu/pods/register_pod.dart';
import 'package:sipayu/utils/text_style.dart';

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  Future initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    log(_locationData.toString());
  }

  @override
  void initState() {
    Future.microtask(() => initLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Daftar Gratis!",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: TextStyleCustom.bold400(),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  TextInput(
                    controller: _nameController,
                    icon: Icons.email_outlined,
                    hintText: 'Masukan Nama Anda',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "No Hp",
                    style: TextStyleCustom.bold400(),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  TextInput(
                    controller: _mobileNoController,
                    icon: Icons.email_outlined,
                    hintText: 'Masukkan No Hp',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Email",
                    style: TextStyleCustom.bold400(),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  TextInput(
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    hintText: 'Masukkan alamat surel',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kata Sandi",
                    style: TextStyleCustom.bold400(),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  TextInput(
                    controller: _passwordController,
                    icon: Icons.password_outlined,
                    hintText: 'Masukan Kata Sandi',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Ulangi Kata Sandi",
                    style: TextStyleCustom.bold400(),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  TextInput(
                    controller: _passwordConfirmationController,
                    icon: Icons.password_outlined,
                    hintText: 'Ulangi Kata Sandi',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/syarat.png'),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Saya telah mambaca ",
                        style: TextStyleCustom.bold400(
                          size: 14,
                        ),
                      ),
                      Text(
                        "Ketentuan Layanan",
                        style: TextStyleCustom.bold400(
                          size: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.read(registerPodProvider.notifier).regsiter(
                                name: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                mobileNo: _mobileNoController.text.trim(),
                                password: _passwordController.text.trim(),
                                passwordConfirmation:
                                    _passwordConfirmationController.text.trim(),
                                latitude: _locationData.latitude.toString(),
                                logitude: _locationData.longitude.toString(),
                              ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        textStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      child: const Text(
                        "Lanjutkan",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
