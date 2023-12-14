import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(
  BuildContext context, {
  Function()? yes,
}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Batal"),
    onPressed: () => Get.back(),
  );
  Widget continueButton = TextButton(
    onPressed: yes,
    child: const Text("Continue"),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Login"),
    content: const Text("Apakah Anda ingin logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
