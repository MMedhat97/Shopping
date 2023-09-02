import 'package:shopping/consts/consts.dart';

Widget CategoryImg ({icon,String?title}){
  return Column(
    children: [
      Image.asset(icon,width: 120,height:200,fit: BoxFit.cover),
      10.heightBox,
      title!.text.align(TextAlign.center).fontFamily(semibold).color(darkFontGrey).make(),
      // 10.heightBox,
      // title2!.text.fontFamily(bold).color(Colors.red).make(),
    ],
  );
}