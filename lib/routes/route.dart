import 'package:get/get.dart';

import '../pages/addTask_Screen.dart';
import '../pages/home_Screen.dart';

class Routes{
 static List<GetPage> get pages =>[
   GetPage(name: '/HomeScreen', page:()=>const HomeScreen()),
   GetPage(name: '/AddTaskScreen', page:()=>const AddTaskScreen()),

 ];

}