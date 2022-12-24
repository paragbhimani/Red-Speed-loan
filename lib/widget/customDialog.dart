import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/utils/colors_constant.dart';

Widget customDialog(
    {required String image,
    VoidCallback? onPressed,
    required String text,
    required bool showElevated}) {
  return Column(
    children: [
      SizedBox(
          height: Get.height * 0.2,
          width: Get.width * 0.3,
          child: Image.asset(image)),
      Text(
        text,
        textAlign: TextAlign.center,
      ),
      showElevated
          ? ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorConstant.primaryColor),
              ),
              onPressed: onPressed,
              child: const Text("ok"),
            )
          : const SizedBox(),
    ],
  );
}
