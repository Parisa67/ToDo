import 'package:get/get.dart';

import 'package:getxtodo/controllers/task_controller.dart';
import 'package:getxtodo/controllers/text_editing_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TaskController());
   Get.put(TextFieldController());
  }

}