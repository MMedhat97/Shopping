import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/lists.dart';
import 'package:shopping/views/homescreen/components/featured_products.dart';
import 'package:shopping/widgetscommon/our_button.dart';

class ItemDetails extends StatelessWidget {

  final String? title;

  const ItemDetails({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: title!.text.size(15).color(darkFontGrey).make(),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                          autoPlay: true,
                          height: 300,
                          itemCount: 5,
                          aspectRatio: 16 / 9,
                          itemBuilder: (context,index){
                          return Image.asset(featuredproducts[index],width: double.infinity,fit: BoxFit.cover,);
                      }),

                      10.heightBox,
                      title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),

                      10.heightBox,
                      VxRating(onRatingUpdate: (value){},normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: false,
                      ),
                      
                      10.heightBox,
                      "\$30,000".text.size(18).color(Colors.red).fontFamily(bold).make(),

                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands".text.color(darkFontGrey).fontFamily(semibold).size(16).make(),
                            ],
                          )),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded,color: darkFontGrey,),
                          ),
                        ],
                      ).box.color(textfieldGrey).padding(const EdgeInsets.symmetric(horizontal: 16)).height(60).make(),

                      20.heightBox,
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Color: ".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: List.generate(3, (index) => VxBox().size(40,40).
                                roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 4)).make()),

                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),


                          20.heightBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity: ".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                                  "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                                  10.widthBox,
                                  "(0 available)".text.color(textfieldGrey).make(),
                                ],
                              ),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          20.heightBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total: ".text.color(textfieldGrey).make(),
                              ),
                              "\$0.00".text.color(Colors.red).size(16).make(),

                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                        ],
                      ).box.shadowSm.white.make(),

                      10.heightBox,
                      "Description".text.fontFamily(semibold).color(darkFontGrey).make(),

                      10.heightBox,
                      "This is $title item and $title description here...".text.color(darkFontGrey).make(),

                      10.heightBox,
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(itemdetails.length, (index) => ListTile(
                        title: itemdetails[index].text.fontFamily(semibold).make(),
                        trailing: const Icon(Icons.arrow_forward),
                        )),
                      ),

                      20.heightBox,
                      productsyoumayalsolike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),

                      20.heightBox,
                      Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        decoration:const  BoxDecoration(
                          color: textfieldGrey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  ],
                                )).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),





                ],
                  ).box.shadowSm.white.make(),
              ),
              )),


            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: redColor,
                onPress: (){},
                textcolor: whiteColor,
                title: "Add to cart",
              ),
            ),
          ],

      ),
      );

  }
}
