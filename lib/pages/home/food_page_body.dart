import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/food/papular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_popular_controller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //macht die andere aussehen
  PageController pageController = PageController(viewportFraction: 0.85);




  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    print("height: " +
        Dimensions.screenHeight.toString() +
        "\n width: " +
        Dimensions.screenWidth.toString());

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print('current value ' + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      //Slider section -- if any data updated we should use GetBuilder
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return popularProducts.isLoaded?Container(
          height: Dimensions.pageView,


            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }),

        ):CircularProgressIndicator(color: AppColors.mainColor,);
      }),
      GetBuilder<PopularProductController>(builder: (popularProducts){
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty?1 :popularProducts.popularProductList.length ,
          position: _currPageValue,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.mainColor),
        );
      }),

      //Popular text

      SizedBox(
        height: Dimensions.height30,
      ),
      //text (Popular ...)
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(
              text: "Recommended",
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 3),
              child: BigText(
                text: ".",
                color: Colors.black26,
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: SmallText(
                text: "Food pairing",
              ),
            ),

          ],
        ),
      ),

      SizedBox(
        height: Dimensions.height10,
      ),
      //the List
      GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
        return recommendedProduct.recommendedProductList.isEmpty?CircularProgressIndicator(color: AppColors.mainColor,):ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index) {
              ProductModel product= recommendedProduct.recommendedProductList[index];

              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood(index,"Cart"));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //Image section
                      Container(
                        width: Dimensions.width120,
                        height: Dimensions.height120,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!)),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          padding:EdgeInsets.all(Dimensions.height10),
                          height: Dimensions.height20*5,
                          decoration: BoxDecoration(                              borderRadius:
                              BorderRadius.only(topRight:Radius.circular(Dimensions.radius20),bottomRight: Radius.circular(Dimensions.radius20)),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BigText(text: product.name!),

                              SmallText(text: product.description!,maxLine: 1,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.circle, text: "Normal", iconColor: AppColors.iconColor1, iconSize: Dimensions.iconSize17, textSize: Dimensions.font10,),
                                  IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor, iconSize: Dimensions.iconSize17, textSize: Dimensions.font10,),
                                  IconAndTextWidget(icon: Icons.access_time_rounded, text: "15min", iconColor: AppColors.iconColor2, iconSize: Dimensions.iconSize17, textSize: Dimensions.font10,),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      })
    ]);
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {

    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      //Transform lass uns mit matrix arbeiten.
      transform: matrix,
      child: Stack(
          //Stack lass uns Widget ohne position machen .. das heißt , wir konnen eine andere Box auf Stack machen
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getPopularFood(index,"cart"));
              },
              child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!))),
              ),
            ),
            //Align ist ein Box für Beschreibung des Bilds
            Align(
              //Align lass uns alignment benutzen
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,

                margin: EdgeInsets.only(
                    left: Dimensions.width40,
                    right: Dimensions.width40,
                    bottom: Dimensions.width30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                //diese Container hat die Beschreibung des Bilds(text-bewertung-abstand)
                child: Container(
                  padding: EdgeInsets.only(top:Dimensions.height10, right: Dimensions.height10,left: Dimensions.height10),
                  child: AppColumn(text:popularProduct.name!),
                ),
              ),
            )
          ]),
    );
  }
}
