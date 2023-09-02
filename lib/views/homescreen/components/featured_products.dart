import 'package:shopping/consts/consts.dart';

Widget FeaturedProducts ({String?title1,String?title2 ,icon}){
  return Column(
    children: [
      Image.asset(icon,width: 200,height:150,fit: BoxFit.cover),
      10.heightBox,
      title1!.text.fontFamily(semibold).color(darkFontGrey).make(),
      10.heightBox,
      title2!.text.fontFamily(bold).color(Colors.red).make(),
    ],
  ).box.roundedSM.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(8)).outerShadowSm.white.make();
}