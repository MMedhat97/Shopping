
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/controller/auth_controller.dart';
import 'package:shopping/controller/profile_controller.dart';
import 'package:shopping/services/firestore_services.dart';
import 'package:shopping/views/authscreen/login_screen.dart';
import 'package:shopping/views/profilescreen/components/details_profile_card.dart';
import 'package:shopping/views/profilescreen/edit_profileScreen.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return  bgWidget(
      child: Scaffold(
        body: StreamBuilder(
        stream: firestoreServices.getUser(currentUser?.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child:CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red)),
              );
            }else {


              var data = snapshot.data!.docs[0];

              return  SafeArea(
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: const Icon(Icons.edit,color: Colors.white,)).onTap(() {
                          controller.nameController.text=data['name'];
                          // controller.passwordController.text=data['password'];
                          Get.to(()=>EditProfileScreen(data:data));
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [

                            data['imgUrl'] ==''
                            ? Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(data['imgUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),

                            5.widthBox,
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}".text.white.fontFamily(semibold).make(),
                                "${data['email']}".text.white.make(),
                              ],
                            )),

                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side :const BorderSide(
                                      color: Colors.white,
                                    )),

                                onPressed: () async {
                                  await Get.put(AuthController()).signoutMethod(context);
                                  Get.offAll(()=>LoginScreen());

                                }, child: logout.text.fontFamily(semibold).white.make()
                            ),

                          ],
                        ),
                      ),
                      10.heightBox,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DetailsProfileCard(count: data['cart_count'],title: "in your cart",width: context.screenWidth/3.4),
                              DetailsProfileCard(count: data['wishlist_count'],title: "in your wishlist",width: context.screenWidth/3.4),
                              DetailsProfileCard(count: data['order_count'],title: "in your orders",width: context.screenWidth/3.4),

                            ],
                          ),
            5.heightBox,
            ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
            return const Divider(
            color:lightGrey ,
            );
            },
            itemCount: profilebuttonlist.length,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(
            leading: Image.asset(profilebuttonicons[index],
            width: 22,),
            title: "${profilebuttonlist[index]}".text.color(darkFontGrey).make(),
            );
            }).box.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 12)).white.shadowSm.rounded.make()
                ],



                      ).box.color(Colors.red).make(),
                        ],
                      ),


                  );
            }




    },

    ),
    ),
    );
  }
}