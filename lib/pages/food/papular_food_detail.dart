import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/app_column.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Stack lass mich viele sache zusammen aufandere setzen.
      body: Stack(
        children: [
          //the image
          Positioned(left: 0, right: 0, child:
          Container(
          width: double.maxFinite,
          height: Dimensions.popularFoodImgSize,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/image/burger.jpg"))
          ),
        )),

          //the Buttuns
          Positioned(
              left:Dimensions.width20,
              right:Dimensions.width20,
              top: Dimensions.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined)
            ],
          )),

          //the Details
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), topLeft: Radius.circular(Dimensions.radius20)), color: Colors.white),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Side",),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce")

                  ],
                ),
          ))

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(color:AppColors.buttonBackgroundColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20*2), topRight: Radius.circular(Dimensions.radius20*2))),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "9"),
                  SizedBox(width: Dimensions.width5,),
                  Icon(Icons.add,color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),color: AppColors.mainColor),
              child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
