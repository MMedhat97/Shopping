import 'package:shopping/consts/colors.dart';
import 'package:shopping/views/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/strings.dart';
import 'consts/styles.dart';
import 'package:flutter/services.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  runApp(const Myapp());

}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme :ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:const AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: SplashScreen(),
    );
  }
}


