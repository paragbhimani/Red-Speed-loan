import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/utils/colors_constant.dart';
import 'package:lone_counter/utils/image_constant.dart';
import 'package:lone_counter/utils/routes.dart';
import 'package:lone_counter/utils/text_style_constant.dart';

class LoanStatusView extends StatelessWidget {
  const LoanStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset('assets/backgrounds/lone_status.png'),
          Padding(
              padding: EdgeInsets.only(top: Get.height * 0.1),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'You have not\napplied yet',
                    textAlign: TextAlign.center,
                    style: TextStyleConstant.bold18
                        .copyWith(color: ColorConstant.white),
                  ))),
          false
              ? Center(
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.loanDetailView);
                },
                child: Image.asset(ImageConstant.applyNow,
                    width: Get.width * 0.35)),
          )
              : ListView.builder(
            itemCount: 8,
            padding: EdgeInsets.only(
                top: Get.height * 0.25,
                left: Get.width * 0.02,
                right: Get.width * 0.02),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    Padding(
                      padding: EdgeInsets.only(bottom: Get.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _text(flex: 2,text: 'Sr.No',isHead: true),
                          _text(flex: 4,text: 'Appl.No',isHead: true),
                          _text(flex: 3,text: 'Date',isHead: true),
                          _text(flex: 3,text: 'Status',isHead: true)
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _text(flex: 2,text: (index + 1).toString(),isHead: false),
                        _text(flex: 4,text: 'INSPA718747',isHead: false),
                        _text(flex: 3,text: '21/12/2022',isHead: false),
                        _text(flex: 3,text: 'Pending',isHead: false)
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ]),
      ),
    );
  }

  Widget _text({required int flex, required String text, required bool isHead}) {
    return Expanded(
        flex: flex,
        child: Center(
          child: Text(text,
              style: isHead
                  ? TextStyleConstant.bold18
                  .copyWith(color: ColorConstant.black)
                  : TextStyleConstant.bold16.copyWith(
                  color: ColorConstant.black,
                  fontWeight: FontWeight.normal)),
        ));
  }
}
