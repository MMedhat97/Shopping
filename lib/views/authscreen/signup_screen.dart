import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/controller/auth_controller.dart';
import 'package:shopping/views/homescreen/home.dart';
import 'package:shopping/widgetscommon/applogo_widget.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:shopping/widgetscommon/custom_textfield.dart';
import 'package:shopping/widgetscommon/our_button.dart';
import 'package:get/get.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen ({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck =false;
  var controller =Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "join the $appname".text.fontFamily(bold).white.size(19).make(),
            20.heightBox,
            Obx(()=>
              Column(
                children: [
                  customeTextField(title:name,hint: nameHint ,controller: nameController,ispass: false),
                  customeTextField(title:email,hint: emailhint,controller: emailController,ispass:false),
                  customeTextField(title:password,hint:passwordhint,controller: passwordController,ispass: true),
                  customeTextField(title:retypePassword,hint: passwordhint,controller: passwordRetypeController,ispass: true),

                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.red,
                        checkColor: Colors.white,
                          value: isCheck, onChanged: (newValue) {
                          setState(() {
                            isCheck =newValue;
                          });

                      },
                      ),

                      5.widthBox,
                      Expanded(
                        child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ",
                                style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: termandcond,
                                style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )),
                            TextSpan(text: " & ",
                                style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text:privacyPolicy,
                                style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),

                          ],
                        )),
                      ),
                    ],
                  ),

                  5.heightBox,
                  controller.isloading.value? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  )
                  :ourButton(color: isCheck==true? redColor:lightGrey,textcolor: whiteColor,title:signup,onPress: () async {
                    if(isCheck !=false){
                      controller.isloading(true);
                      try{
                        await controller.signupMethod(context: context,email: emailController.text,password: passwordController.text,).then((value) {
                          return controller.storeUserData(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,

                          );
                        }).then((value) {
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(() => Home());
                        });

                      }catch (e){
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                        controller.isloading(false);
                      }
                    }
                  },
                  )
                      .box
                      .width(context.screenWidth - 50)
                      .make(),

                  10.heightBox,
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveanAccount,
                        style: TextStyle(
                          fontFamily: bold,color: fontGrey,
                        ),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(
                          fontFamily: bold,color: Colors.red,
                        ),
                      ),

                    ],
                  )).onTap(() {
                    Get.back();
                  }),




                ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
            ),

          ],
        ),

      ),
    ));
  }
}


