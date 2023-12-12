// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/widgets/text_input.dart';
import 'package:sipayu/utils/text_style.dart';

class EditProfileScreen extends StatefulHookConsumerWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Ascaliko",
                      style: TextStyleCustom.bold600(size: 26),
                    ),
                  ),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.network(
                        "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Email",
                style: TextStyleCustom.bold400(),
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextInput(
                controller: TextEditingController(),
                icon: Icons.email_outlined,
                hintText: 'Masukkan alamat surel',
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Kata Sandi",
                style: TextStyleCustom.bold400(),
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextInput(
                controller: TextEditingController(),
                icon: Icons.password_outlined,
                hintText: 'Masukan Kata Sandi',
                obscureText: true,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Auntentikasi",
                style: TextStyleCustom.bold400(),
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextInput(
                controller: TextEditingController(),
                icon: Icons.email_outlined,
                hintText: 'Auntentikasi',
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
            child: const Text(
              "Simpan",
            ),
          ),
        ),
      ),
    );
  }
}
