
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtodo/constant.dart';
import 'package:getxtodo/controllers/task_controller.dart';
import 'package:getxtodo/controllers/text_editing_controller.dart';

import '../main.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(klightblueColor,Brightness.dark);
    return Scaffold(
      floatingActionButton: floatingWidget(),
      body:SafeArea(
        child: Stack(
alignment: Alignment.bottomCenter,
          children: [

          sectionTopWidget(),
          sectionListWidget(),
        ],),
      ),
    );
  }

  FloatingActionButton floatingWidget() {
    return FloatingActionButton(
      heroTag: 'hero' ,
      onPressed: (){
          Get.find<TextFieldController>().title!.text= "";
            Get.find<TextFieldController>().subTitle!.text="";
            Get.find<TaskController>().isEditing=false;
      Get.toNamed("/AddTaskScreen")!.then((value) {
        MyApp.changeColor(klightblueColor,Brightness.light);
      });
    },
    backgroundColor: klightblueColor,
    elevation: 0,
    child:const Icon(Icons.add),
    );
  }

  Container sectionListWidget() {
    return Container(
          width: Get.width,
          height: Get.height *0.6,

          decoration:const BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
          ),
      child: Container(
        margin:const EdgeInsets.only(left: 50,right: 10,top:20),
       
        // child:GetBuilder<TaskController>(builder: (value){
        //   print("object");
        //   return  ListView.separated(itemBuilder: (context, index){ 
        //    var task=Get.find<TaskController>().tasks[index];
        //    return  ListTile(
        //   title: Text(task.title ?? ""),
        //   subtitle:Text(task.subTitle ?? ""),
        //   onTap: (){
        //     //edit
        //     Get.find<TaskController>().isEditing.value=true;
        //     Get.find<TaskController>().index=index;
        //     Get.find<TextFieldController>().title!.text= task.title!;
        //     Get.find<TextFieldController>().subTitle!.text= task.subTitle!;
        //     Get.toNamed("/AddTaskScreen");
        //   },
        //   onLongPress: (){
        //     Get.defaultDialog(title:"are u sure to remove item?",onCancel: (){
        //       Get.back();
        //     },onConfirm: (){
        //           Get.find<TaskController>().tasks.removeAt(index);
        //     });
           
        //   },
        //   trailing:Checkbox(onChanged: (value){

        //     task.status= !task.status!;
        //   },value:task.status ,
        //     side:const BorderSide(color: Colors.black45,width: 0.5) ,
        //   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,activeColor:
        //     kblackColor

        //     ,),
        // );},
        //     separatorBuilder: (context, index) => const Divider(color: Colors.grey,height: 1,),
        //      itemCount: Get.find<TaskController>().tasks.length);
        // },)
      child:  Obx((){
         return  ListView.separated(itemBuilder: (context, index){ 
           var task=Get.find<TaskController>().tasks[index];
           return  ListTile(
          title: Text(task.title ?? ""),
          subtitle:Text(task.subTitle ?? ""),
          onTap: (){
            //edit
            Get.find<TaskController>().isEditing=true;
            Get.find<TaskController>().index=index;
            Get.find<TextFieldController>().title!.text= task.title!;
            Get.find<TextFieldController>().subTitle!.text= task.subTitle!;
            Get.toNamed("/AddTaskScreen");
          },
          onLongPress: (){
            Get.defaultDialog(title:"are u sure to remove item?",
            contentPadding:EdgeInsets.all(10)
            ,middleText:"",onCancel: (){
              Get.back();
            },onConfirm: (){
                  Get.find<TaskController>().tasks.removeAt(index);
                  Get.back();
            });
           
          },
          trailing:Checkbox(
            
            onChanged: (value){

            task.status= !task.status!;
            Get.find<TaskController>().tasks[index]=task;
          },value:task.status ,
            side:const BorderSide(color: Colors.black45,width: 0.5) ,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,activeColor:
            klightblueColor

            ,),
        );},
            separatorBuilder: (context, index) => const Divider(color: Colors.grey,height: 1,),
             itemCount: Get.find<TaskController>().tasks.length);
        }),
      ),
        );
  }

  Container sectionTopWidget() {
    return Container(color: klightblueColor,
        width: Get.width,
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
          margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.menu,color: Colors.white,)),



                ],),
              ),
           Container(
             margin:const EdgeInsets.only(left: 40,top: 20),
             child:const CircleAvatar(
               radius: 20,
               backgroundColor: Colors.white,
               child: Center(child:Icon(Icons.bookmark,color: klightblueColor,)),
             ),
           ),
              Container(
                margin:const EdgeInsets.only(left: 50,top: 20),
                child:const Text("All",style: TextStyle(color: Colors.white,fontSize: 25,

                  fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                margin:const EdgeInsets.only(left: 50,top: 5 ),
                child:
                 Obx((){
                  return Text("${Get.find<TaskController>().tasks.length} Tasks",style: const TextStyle(color: Colors.white,fontSize: 18,


                ),);
                })
              )

            ],
          ),
      );
  }

}