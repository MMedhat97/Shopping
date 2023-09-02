import 'package:shopping/consts/consts.dart';


Widget ourButton({color,textcolor,String?title,onPress}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPress,

      child: title!.text.fontFamily(bold).color(textcolor).make());
}