import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/image_constant.dart';
import 'package:lone_counter/utils/routes.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            ImageConstant.calculatorBG,
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Get.width * 0.35,
              left: Get.width * 0.02,
              right: Get.width * 0.02,
              bottom: Get.width * 0.05
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageTap(
                        image: ImageConstant.emiCalculator,
                        onTap: () {
                          Get.toNamed(Routes.emiCalculatorView);
                        },
                      ),
                      imageTap(
                          image: ImageConstant.compareLoan,
                          onTap: () =>
                              Get.toNamed(Routes.compareLoneCalculator))
                    ],
                  ),
                  NativeBig(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageTap(
                          image: ImageConstant.fdCalculator,
                          onTap: () => Get.toNamed(Routes.fdCalculatorView)),
                      imageTap(
                          image: ImageConstant.sipCalculator,
                          onTap: () =>
                              Get.toNamed(Routes.simpleCalculatorView)),
                    ],
                  ),
                  NativeBig(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget imageTap({VoidCallback? onTap, required String image}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(image,
          height: Get.height * 0.21, width: Get.width * 0.28, fit: BoxFit.fill),
    );
  }
}
