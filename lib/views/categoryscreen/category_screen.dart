import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/views/categoryscreen/category_details.dart';
import 'package:shopping/views/homescreen/components/category_img.dart';
import 'package:shopping/widgetscommon/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),

        body : Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 14,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250),
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    CategoryImg(icon:categoryimg[index],title: categorytitle [index]),
                  ],
              ).box.rounded.width(200).clip(Clip.antiAlias).outerShadowSm.white.make().onTap(() {
                Get.to(()=> CategoryDetails(title: categorytitle[index]));
                });

            })),
        )
      );
  }
}