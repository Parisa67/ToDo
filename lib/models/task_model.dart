class TaskModel{
String? title;
String? subTitle;
bool? status;
 TaskModel({ required this.title,required this.subTitle,required this.status});

Map<String,dynamic>toJson(){
  return {
    'title' :title,
    'subTitle' :subTitle,
    'status' :status
  };
}

TaskModel.fromJson(Map<String,dynamic> jsn):
title=jsn['title'],
subTitle=jsn['subTitle'],
status=jsn['status'];

}