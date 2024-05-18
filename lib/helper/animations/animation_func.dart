import 'package:decor_home/helper/animations/animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> navigateWithDelay(BuildContext context, String route) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: DelayedAnimation(),
      );
    },
  );

  await Future.delayed(const Duration(seconds: 10));

  Navigator.of(context).pop(); // Close the animation dialog
  Get.toNamed(route);
}
