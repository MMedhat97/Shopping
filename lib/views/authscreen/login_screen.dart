import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/controller/auth_controller.dart';
import 'package:shopping/views/authscreen/signup_screen.dart';
import 'package:shopping/views/homescreen/home.dart';
import 'package:shopping/widgetscommon/applogo_widget.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:shopping/widgetscommon/custom_textfield.dart';
import 'package:shopping/widgetscommon/our_button.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());


    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Login in to $appname".text.fontFamily(bold).white.size(19).make(),
            20.heightBox,
            Obx(
                  ()=> Column(
                  children: [
                    customeTextField(title:email,hint: emailhint,ispass: false,controller: controller.emailController),
                    customeTextField(title:password,hint:passwordhint,ispass: true,controller: controller.passwordController),
                    Align(
                        alignment:Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: forgetPass.text.make())),

                    5.heightBox,
                    // ourButton().box.width(context.screenWidth-50).make(),

                    controller.isloading.value
                        ?const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.red),
                    )
                        :ourButton(color: redColor,textcolor: whiteColor,title: login,
                        onPress: () async{
                          controller.isloading(true);




                      await controller.loginMethod(context: context).then((value){
                        if(value!=null){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(() => Home());

                        }else {
                          controller.isloading(false);
                        }
                      });

                    })
                        .box
                        .width(context.screenWidth - 50)
                        .make(),

                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),

                    5.heightBox,
                    ourButton(color: lightgolden,textcolor: redColor,title:signup,onPress: (){
                      Get.to(()=> SignupScreen());

                    })
                        .box
                        .width(context.screenWidth - 50)
                        .make(),

                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),

                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                        child: Image.asset(socialIconList[index],
                        width: 30,
                        ),
                      ),
                          )),
                    )

                  ],
              ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
            ),

          ],
        ),

      ),
    ));
  }
}
