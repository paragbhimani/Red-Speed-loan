import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/model/loan_instant_model.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/colors_constant.dart';
import 'package:lone_counter/utils/image_constant.dart';
import 'package:lone_counter/utils/routes.dart';
import 'package:lone_counter/utils/string_constant.dart';
import 'package:lone_counter/utils/text_style_constant.dart';
import 'package:lone_counter/widget/app_bar.dart';

class InstantLoanView extends StatelessWidget {
  const InstantLoanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: StringConstant.loanInstant),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[0].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[0].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),NativeBig(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[1].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[1].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),NativeBig(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[2].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[2].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),NativeBig(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[3].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[3].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),NativeBig(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[4].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[4].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),NativeBig(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Image.asset(ImageConstant.loanInstant),
                    title: Text(
                      loanInstantModel[5].title ?? "",
                      style: TextStyleConstant.bold16Black,
                    ),
                    subtitle: Text(
                      loanInstantModel[5].subTitle ?? "",
                      style: TextStyleConstant.bold14Black,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),
              NativeBig(),

            ],
          ),
        ),
      ),
    );
  }
}
