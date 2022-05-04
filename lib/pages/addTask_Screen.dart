import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtodo/constant.dart';
import 'package:getxtodo/controllers/task_controller.dart';

import '../controllers/text_editing_controller.dart';
import '../main.dart';
import '../models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(const Color(0xfff5f5f5),Brightness.dark);
    return Scaffold(
backgroundColor:const Color(0xfff5f5f5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            titleScreen(),
            taskTextField(),
            addNoteTextField(),
            button()

        ],),
      ),
    );
  }

  Container button() {
    return Container(
            margin:const  EdgeInsets.symmetric(horizontal: 20),
            width:Get.width,
            height: 40,
            child: ElevatedButton(onPressed: (){
             if( Get.find<TaskController>().isEditing
             ){
              var task =Get.find<TaskController>().tasks[Get.find<TaskController>().index];
                  task.title=Get.find<TextFieldController>().title!.text;
                  task.subTitle=Get.find<TextFieldController>().subTitle!.text;
                  Get.find<TaskController>().tasks[Get.find<TaskController>().index]=task;
              }

               else {
                Get.find<TaskController>().tasks.add(
                TaskModel(title:Get.find<TextFieldController>().title!.text,
                status: false ,
                subTitle: Get.find<TextFieldController>().subTitle!.text));
               }
            
              
           Get.back();
          
             },
              style: TextButton.styleFrom(elevation: 0,backgroundColor: klightblueColor),
          child: Text(
            Get.find<TaskController>().isEditing?"Edit":
            "Add"),
          ),);
  }

  Container addNoteTextField() {
    return Container(
            margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            child: TextField(
                controller:Get.find<TextFieldController>().subTitle ,
              maxLength: 30,
              cursorColor: klightblueColor,

              decoration: InputDecoration(
                  
                prefixIcon:const Icon(Icons.bookmark_border,color:Colors.grey),
                border: InputBorder.none,
                counter: Container(),
                hintText: "Add Note"
              ),

            ),
          );
  }

  Container taskTextField() {
    return Container(
              margin:const EdgeInsets.only(left:20,right:20) ,

    child: TextField(
      controller:Get.find<TextFieldController>().title ,
              maxLines: 6,
              cursorColor: klightblueColor,
              cursorHeight: 40,
              decoration: InputDecoration(
                enabledBorder:UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)
                ),
                  focusedBorder:UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)
                  )
              ),

            ),
          );
  }

  Container titleScreen() {
    return Container(
      margin:const EdgeInsets.only(left:20,top:10) ,

      child:  Text("what are your plan?",style: TextStyle(fontSize:16,color:Colors.grey[600] ),)
,);
  }

  Container appBar() {
    return Container(
      margin: const EdgeInsets.only(top:10) ,

      child: Row(children: [
          Expanded(child: Text(
           Get.find<TaskController>().isEditing?
           "Edit Task":"Add Task"
                ,style: const TextStyle(fontSize: 18)
                ,textAlign: TextAlign.center,)),

          Hero(
            tag: 'hero',
            child: Material(
              child: IconButton(onPressed: (){
                Get.back();
              },
                  icon:const Icon(Icons.close)),
            ),
          )
        ],));
  }
}