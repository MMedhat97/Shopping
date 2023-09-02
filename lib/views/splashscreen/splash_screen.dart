import 'package:shopping/consts/consts.dart';
import 'package:shopping/views/homescreen/home.dart';
import 'package:shopping/widgetscommon/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../authscreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //create a method to change screen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //usin getx
      auth.authStateChanges().listen((user) {
        if (user == null && mounted){
          Get.to(()=>LoginScreen());
        }else{
          Get.to(() =>Home());
        }
      });

      // Get.to(() => LoginScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
                child:Image.asset(icSplashBg,width: 300),
            ),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            //splash Screen UI completed.....
          ],
        ),
      ),
    );
  }
}
