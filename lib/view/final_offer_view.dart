import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lone_counter/controller/final_offer_controller.dart';
import 'package:lone_counter/utils/image_constant.dart';
import 'package:lone_counter/utils/string_constant.dart';
import 'package:lone_counter/widget/app_bar.dart';
import 'package:lone_counter/widget/customDialog.dart';
import 'package:lone_counter/widget/custom_button.dart';
import 'package:lone_counter/utils/share_preference.dart';

class FinalOfferView extends StatelessWidget {
  FinalOfferView({Key? key}) : super(key: key);

  final FinalOfferController finalOfferController =
      Get.put(FinalOfferController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinalOfferController>(
        builder: (controller) => Scaffold(
              appBar: customAppBar(title: StringConstant.finalOfferView),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.04,
                      vertical: Get.height * 0.02),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: double.infinity,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Demand Promissory note",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          textAlign: TextAlign.start,
                          "On Deman I residing , Severally Promises to Personal Loan a Sum of Payable amount together with interest rate @14.5% per year.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const Divider(),
                        const Text(
                          textAlign: TextAlign.start,
                          "The Processing fees charges included GST to Loan.",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          textAlign: TextAlign.start,
                          "Agree  Accepted by Browser",
                          style: TextStyle(fontSize: 22),
                        ),
                        Row(
                          children: const [
                            Text(
                              textAlign: TextAlign.start,
                              "Name:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              "Application Loan",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              textAlign: TextAlign.start,
                              "Date:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        !controller.isShow
                            ? Center(
                                child: elevatedButton(
                                  () {
                                    String applicationId = 'INSPA';
                                    for (int i = 0; i < 6; i++) {
                                      applicationId = applicationId +
                                          Random().nextInt(9).toString();
                                    }
                                    Get.defaultDialog(
                                      title: "Congratulations",
                                      content: customDialog(
                                        image: ImageConstant.quality,
                                        text:
                                            "Your application $applicationId Updated Successfully",
                                        showElevated: true,
                                        onPressed: () {
                                          List<dynamic> storedValue =
                                              AppSharedPreference.value;

                                          storedValue.add({
                                            "id": applicationId,
                                            "date": DateFormat('dd/MM/yyyy')
                                                .format(DateTime.now())
                                          });
                                          AppSharedPreference.setValue(
                                              storedValue);
                                          Get.back();
                                          controller.isShow = true;
                                          controller.update();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ]),
                ),
              ),
            ));
  }
}
