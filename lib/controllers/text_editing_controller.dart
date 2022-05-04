

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{
  TextEditingController? title;
  TextEditingController? subTitle;
  @override
  void onInit() {
 title=TextEditingController();
 subTitle=TextEditingController();
    super.onInit();
  }
}