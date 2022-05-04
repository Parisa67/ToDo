
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxtodo/models/task_model.dart';

class TaskController extends GetxController{
bool isEditing =false;
int index =0;
 RxList<TaskModel> tasks =<TaskModel>[].obs;


@override
  void onInit() {
   var box =GetStorage();
   if(box.read('tasks')!= null){
     var list =box.read('tasks');
     for(var item in list){
      tasks.add(TaskModel.fromJson(item)); 
     }
   }
    super.onInit();

// یک لیسنر که به منغیر تسک گوش میده اگر اضافه شد ،دیلیت شد ،ادیت شد
//متدی که برایش نوشته اییم را اجرا میکند
    ever(tasks, (value){
box.write("tasks", tasks.toJson());
    });
  }
}