import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/controller/lone_status_controller.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/colors_constant.dart';
import 'package:lone_counter/utils/image_constant.dart';
import 'package:lone_counter/utils/routes.dart';
import 'package:lone_counter/utils/text_style_constant.dart';

class LoanStatusView extends StatelessWidget {
  LoanStatusView({Key? key}) : super(key: key);
  final LoneStatusController controller = Get.put(LoneStatusController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoneStatusController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset('assets/backgrounds/loan_status.jpg'),
              controller.data.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.1),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'You have not\napplied yet',
                            textAlign: TextAlign.center,
                            style: TextStyleConstant.bold18
                                .copyWith(color: ColorConstant.white),
                          )))
                  : Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.08),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'If Your application in pending\nstate from last 7 days. Apply\nanother application and email\nus with application number',
                          textAlign: TextAlign.center,
                          style: TextStyleConstant.bold16
                              .copyWith(fontSize: 15)
                              .copyWith(color: ColorConstant.white),
                        ),
                      ),
                    ),
              controller.data.isEmpty
                  ? Padding(
                    padding: EdgeInsets.only(top: Get.width * 0.6),
                    child: Column(
                      children: [
                        CustomBannerAd(),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  AppOpenAdManager.interstitialAd?.show();
                                  Get.toNamed(Routes.loanDetailView);
                                },
                                child: Image.asset(ImageConstant.applyNow,
                                    width: Get.width * 0.35)),
                          ),
                        NativeBig()
                      ],
                    ),
                  )
                  : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: controller.data.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                top: Get.width * 0.57,
                                left: Get.width * 0.02,
                                right: Get.width * 0.02),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if(index == 0)
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: Get.width * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          _text(flex: 2, text: 'Sr.No', isHead: true),
                                          _text(
                                              flex: 4, text: 'Appl.No', isHead: true),
                                          _text(flex: 3, text: 'Date', isHead: true),
                                          _text(flex: 3, text: 'Status', isHead: true)
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: Get.width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _text(
                                            flex: 2,
                                            text: (index + 1).toString(),
                                            isHead: false),
                                        _text(
                                            flex: 4,
                                            text: controller.data[index]['id'],
                                            isHead: false),
                                        _text(
                                            flex: 3,
                                            text: controller.data[index]['date'],
                                            isHead: false),
                                        _text(flex: 3, text: 'Pending', isHead: false)
                                      ],
                                    ),
                                  ),
                                ]
                              );
                            },
                          ),
                        NativeBig(),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(
      {required int flex, required String text, required bool isHead}) {
    return Expanded(
        flex: flex,
        child: Center(
          child: Text(text,
              style: isHead
                  ? TextStyleConstant.bold18
                      .copyWith(color: ColorConstant.black, fontSize: 16)
                  : TextStyleConstant.bold16.copyWith(
                      color: ColorConstant.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14)),
        ));
  }
}
