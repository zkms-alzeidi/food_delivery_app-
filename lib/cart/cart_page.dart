import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_popular_controller.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (cart) {
      List<CartModel> items = cart.getItems;

      return Stack(
        children: [
          Positioned(
              top: Dimensions.height40,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {Get.toNamed(RouteHelper.initial)},
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize40,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed(RouteHelper.getInitial())},
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.iconSize40,
                    ),
                  ),
                  Stack(
                    children:[
                      AppIcon(
                        icon: Icons.shopping_cart,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.iconSize40,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(Icons.circle, color: Colors.white,size: Dimensions.height20,),
                      ),
                      items.length>0? Positioned(
                        right: 3,
                        top: 4,
                        child: Text(cart.totalItems.toString(), style: TextStyle(color: AppColors.mainColor),),
                      ):Container(),

                    ]
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 4,
              left: Dimensions.width15,
              right: Dimensions.width15,
              bottom: 0,
              child:  Container(
                    margin: EdgeInsets.only(top: Dimensions.height15),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              var productIndex= Get.find<PopularProductController>()
                                  .popularProductList
                                  .indexOf(items[index].product!); //if he can find the product will be saved his index else will save -1

                              if(productIndex>=0){
                                print(productIndex.toString()+" the first");
                                Get.toNamed(RouteHelper.getPopularFood(productIndex, "cartPage"));
                              }else{
                                productIndex= Get.find<RecommendedProductController>()
                                    .recommendedProductList
                                    .indexOf(items[index].product!);
                                print(productIndex.toString()+" the second");
                                Get.toNamed(RouteHelper.getRecommendedFood(productIndex,"cartPage"));
                              }
                            },
                            child: Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL +
                                                      AppConstants.UPLOAD_URL +
                                                      items[index].img!))),
                                    ), //the picture
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: items[index].name!,
                                              size: Dimensions.font26,
                                            ),
                                            SizedBox(height: 10),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                BigText(
                                                    size: Dimensions.font20,
                                                    color: Colors.redAccent,
                                                    text: '\$ ' +
                                                        items[index]
                                                            .price!
                                                            .toString()),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: ()=>{
                                                          cart.addItem(items[index].product!, -1),

                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color:
                                                              AppColors.signColor,
                                                        )),
                                                    SizedBox(
                                                      width: Dimensions.width5,
                                                    ),
                                                    BigText(
                                                        text: items[index].quantity!.toString()),
                                                    SizedBox(
                                                      width: Dimensions.width5,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () => {
                                                          cart.addItem(items[index].product!, 1),
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color:
                                                              AppColors.signColor,
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  )

              )
        ],
      );}),
      bottomNavigationBar:    GetBuilder<CartController>(builder: (cart) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(
                  children: [

                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    BigText(text:"\$"+cart.totalAmount.toString()
                    ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  cart.addToHistory(cart.getItems);

                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: "Pay now",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }));
  }
}
