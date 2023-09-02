import 'package:shopping/consts/consts.dart';

Widget customeTextField({String? title ,String? hint, controller,ispass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(Colors.red).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: ispass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint!,
          isDense:true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
        ),
      ),

      10.heightBox,

      // password.text.fontFamily(semibold).color(Colors.red).size(16).make(),
      //
      // 5.heightBox,
      // TextFormField(
      //   decoration: InputDecoration(
      //     hintStyle: TextStyle(
      //       fontFamily: semibold,
      //       color: textfieldGrey,
      //     ),
      //     hintText: passwordhint,
      //     isDense:true,
      //     fillColor: lightGrey,
      //     filled: true,
      //     border: InputBorder.none,
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(
      //           color: Colors.red
      //       ),
      //     ),
      //   ),
      // ),











































    ],
  );
}