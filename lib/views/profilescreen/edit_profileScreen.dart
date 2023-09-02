import 'dart:io';
import 'package:shopping/consts/consts.dart';
import 'package:shopping/controller/profile_controller.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:shopping/widgetscommon/custom_textfield.dart';
import 'package:shopping/widgetscommon/our_button.dart';
import 'package:get/get.dart';



class EditProfileScreen extends StatelessWidget {

  final dynamic data;

  const EditProfileScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {
var controller = Get.find<ProfileController>();


    return bgWidget(
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //if data img url and controller path is empty
             data ['imgUrl']=='' && controller.profileImagepath.isEmpty
                  ? Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

              //if data is not empty but controller path is empty
                  :data ['imgUrl']!='' && controller.profileImagepath.isEmpty
                  ? Image.network(data['imgUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

              //else if controller path is not empty but data img url is empty
                  :Image.file(File(controller.profileImagepath.value),width: 100,fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),


              10.heightBox,
              ourButton(color:Colors.red,onPress: ( ){
                controller.changeImage(context);
              },textcolor: whiteColor,title: "Change"),
              Divider(),
              20.heightBox,
              customeTextField(hint: nameHint, title: name,ispass: false,controller:controller.nameController),
              10.heightBox,
              customeTextField(hint: passwordhint, title: oldpassword,ispass: true,controller:controller.oldpasswordController),
              10.heightBox,
              customeTextField(hint: passwordhint, title: newpassword,ispass: true,controller:controller.newpasswordController),
              10.heightBox,
              controller.isloading.value? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red))
                  : SizedBox(
                width: context.screenWidth - 40,
                  child: ourButton(
                      color:Colors.red,onPress: ( ) async{
                        controller.isloading(true);

                        //if image not selected
                        if(controller.profileImagepath.value.isNotEmpty){
                          await controller.uploadProfileImage();

                        }else {
                          controller.profileImagelink ==data['imgUrl'];
                        }

                        //if old password matches data bases
                        if(data['password']==controller.oldpasswordController.text){
                          await controller.updateProfile(
                            imgUrl: controller.profileImagelink,
                            name:controller.nameController.text,
                            password: controller.newpasswordController.text,
                          );
                          VxToast.show(context, msg: "Updated");

                        }else{
                          VxToast.show(context, msg: "Wrong Old Password");
                          controller.isloading(false);
                        }

                  },textcolor: whiteColor,title: "Save")),

            ],
          ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50,right: 12,left: 12)).rounded.make(),
        ),
      )
    );
  }
}
