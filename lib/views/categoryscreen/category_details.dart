import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/views/categoryscreen/item_details.dart';
import 'package:shopping/views/homescreen/components/all_products.dart';
import 'package:shopping/views/homescreen/components/featured_products.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String?title;


  const CategoryDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(

      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),

        body: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: List.generate(10, (index) => "Baby Clothes".text
                      .white
                      .size(12)
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .makeCentered()
                      .box.size(120, 60).white.rounded.margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make(),
                ),

        ),
              ),
              5.heightBox,

              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(12),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 300 ,crossAxisSpacing: 8,mainAxisSpacing: 8)
                    , itemBuilder: (context,index){
                  return Column(
                      children: [
                        AllProducts(icon:featuredproducts[index],
                            title1:featuredtitlesproducts[index],
                            title2: featuredpricesproducts[index]),


                      ],


                  ).box.rounded.padding(EdgeInsets.all(12)).width(150).clip(Clip.antiAlias).outerShadowSm.white.make().onTap(() {
                    Get.to(()=>ItemDetails(title:title));
                  });
                }),
              ),
          ],
        ),
      ),
    ));
  }
}
