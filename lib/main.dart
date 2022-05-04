import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxtodo/bindings/bindings.dart';
import 'package:getxtodo/routes/route.dart';
import 'package:google_fonts/google_fonts.dart';

main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme()
        ),
        //move to another page with Transition fade
        defaultTransition: Transition.fadeIn,
        getPages: Routes.pages ,
        initialBinding: MyBindings(),
        initialRoute: '/HomeScreen',
            );
          }

  static void changeColor(Color color,Brightness brightness){
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor:color,statusBarIconBrightness:brightness  ));
  }
}