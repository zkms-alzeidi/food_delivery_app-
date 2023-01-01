import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers%20/recommended_popular_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
   RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product= Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          pinned: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap: (){Get.toNamed(RouteHelper.getInitial());},child: AppIcon(icon: Icons.clear)),
              AppIcon(icon: Icons.shopping_cart_outlined),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              child: Center(
                  child: BigText(
                text: product.name!,
                size: Dimensions.font26,
              )),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: AppColors.yellowColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(width: double.maxFinite,decoration: BoxDecoration(
                image:DecorationImage(fit: BoxFit.cover,image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                  ))
            ),),
          ),
        ),

        // for the description
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                child: ExpandableTextWidget(
                  text:product.description!,
                ),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              AppIcon(
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: BigText(text: "\$ ${product.price} X 0",color: AppColors.mainBlackColor,size: Dimensions.font26,),

              ),
              AppIcon(
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add),
            ],
          ),
          SizedBox(height: Dimensions.height10,),
          // Bottom container for like and  Bottom (Add to cart)

          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(color:AppColors.buttonBackgroundColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20*2), topRight: Radius.circular(Dimensions.radius20*2))),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),color: Colors.white),
                  child: Icon(Icons.favorite,color: AppColors.mainColor )

                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),color: AppColors.mainColor),
                  child: BigText(text: "\$ ${product.price} | Add to cart",color: Colors.white,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
