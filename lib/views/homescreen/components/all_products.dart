import 'package:shopping/consts/consts.dart';

Widget AllProducts ({String?title1,String?title2 ,icon}){
  return Column(
    children: [
      Image.asset(icon,width: 200,height:200,fit: BoxFit.cover),
      10.heightBox,
      title1!.text.fontFamily(semibold).color(darkFontGrey).make(),
      10.heightBox,
      title2!.text.fontFamily(bold).color(Colors.red).make(),
    ],
  );
}