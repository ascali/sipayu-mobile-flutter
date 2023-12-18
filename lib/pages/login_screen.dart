// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/main_screen.dart';
import 'package:sipayu/pages/register_screen.dart';
import 'package:sipayu/pages/widgets/text_input.dart';
import 'package:sipayu/pods/auth_pod.dart';
import 'package:sipayu/utils/text_style.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Masuk Ke Aplikasi",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Form(
                      child: Column(
                        children: [
                          TextInput(
                            controller: _controllerEmail,
                            icon: Icons.email_outlined,
                            hintText: 'Masukan Alamat Surel',
                            maxLines: 1,
                            minLines: 1,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextInput(
                            controller: _controllerPassword,
                            icon: Icons.password_outlined,
                            hintText: 'Masukan Kata Sandi',
                            obscureText: true,
                            maxLines: 1,
                            minLines: 1,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Lupa Kata Sandi",
                                style: TextStyleCustom.bold400(
                                  size: 16,
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.to(const RegisterScreen()),
                                child: Text(
                                  "Daftar Gratis!",
                                  style: TextStyleCustom.bold400(
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () => ref
                                  .read(authPodProvider.notifier)
                                  .login(_controllerEmail.text.trim(),
                                      _controllerPassword.text.trim()),
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
                  const Spacer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
