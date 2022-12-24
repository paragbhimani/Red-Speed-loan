import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
String? fNameError ;
String? lNameError ;

  void validator (){
    fNameError = firstNameController.text.isEmpty ? "Please Enter First Name":null;
    lNameError = lastNameController.text.isEmpty ? "Please Enter Last Name":null;
    update();
  }
}
