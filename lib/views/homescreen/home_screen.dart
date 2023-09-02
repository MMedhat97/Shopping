import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/views/homescreen/components/all_products.dart';
import 'package:shopping/views/homescreen/components/featured_button.dart';
import 'package:shopping/views/homescreen/components/featured_products.dart';
import 'package:shopping/widgetscommon/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: searchanything,
                    hintStyle: TextStyle(color: textfieldGrey),
                  ),
                ),
              ),
              10.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: slidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),

                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homebutton(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  title: index == 0 ? todaydeal : flashsale,
                                )),
                      ),

                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: secondslidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondslidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),


                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => homebutton(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 3.5,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                title: index == 0
                                    ? topcategories
                                    : index == 1
                                        ? brands
                                        : topsellers)),
                      ),

                      20.heightBox,
                      Align(
                          alignment: Alignment.topLeft,
                          child: featuredcategories.text
                              .color(darkFontGrey)
                              .size(18)
                              .fontFamily(semibold)
                              .make()),


                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      FeaturedButtons(
                                          icon: featuredimages1[index],
                                          title: featuredtitles1[index]),
                                      10.heightBox,
                                      FeaturedButtons(
                                          icon: featuredimages2[index],
                                          title: featuredtitles2[index]),
                                    ],
                                  )).toList(),
                        ),
                      ),




                      20.heightBox,
                      Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        decoration:const  BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredproduct.text.fontFamily(bold).white.size(20).make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(6, (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FeaturedProducts(icon:featuredproducts[index],
                                        title1:featuredtitlesproducts[index],
                                        title2: featuredpricesproducts[index]),



                                    // Image.asset(imgP1,width:150 , fit: BoxFit.cover,
                                    // ),
                                    // 10.heightBox,
                                    // "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                    // 10.heightBox,
                                    // "\$600".text.color(Colors.red).fontFamily(bold).size(16).make(),

                                  ],
                                )).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: secondslidersList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondslidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),

                      20.heightBox,
                      GridView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300),
                          itemBuilder: (context,index){
                        return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AllProducts(icon:featuredproducts[index],
                              title1:featuredtitlesproducts[index],
                              title2: featuredpricesproducts[index]),


                        ],
                        );

                          },
                      ),
                      ],
                      ),
                      ),



              ),
                  ],
                ),
        ),
    );

  }
}
