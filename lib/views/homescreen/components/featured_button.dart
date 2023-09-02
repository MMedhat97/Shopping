import 'package:shopping/consts/consts.dart';

Widget FeaturedButtons ({String?title ,icon}){
  return Row(
    children: [
        Image.asset(icon,width: 60,fit: BoxFit.fill),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  ).box.roundedSM.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).outerShadowSm.white.make();
}