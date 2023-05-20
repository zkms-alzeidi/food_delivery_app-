
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cart_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var getHistoryList = Get.find<CartController>().getHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getHistoryList[i].time))
      {
        cartItemsPerOrder.update(getHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    int listCounter = 0;
    return Scaffold(body: GetBuilder<CartController>(builder: (cartController) {

      return Column(
        children: [
          Container(
            height: Dimensions.height100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(

              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    for (int i = 0; i <itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height120,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ((){
                                DateTime parseDate=DateFormat("yyyy-MM-dd HH:mm:ss").parse(getHistoryList[i].time!);
                                var inputDate= DateTime.parse(parseDate.toString());
                                var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                                var outputDate= outputFormat.format(inputDate);
                                return BigText(text:outputDate);
                              }()),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children:
                                      List.generate(itemsPerOrder[i], (index) {
                                        print("the itemsPerOrderLength"+itemsPerOrder[i].toString());
                                        if(listCounter<getHistoryList.length)
                                        {
                                          listCounter++;
                                        }
                                        return index<=2?  Container(
                                            width: Dimensions.width40*2,
                                            height: Dimensions.height40*2,
                                            margin: EdgeInsets.only(right: Dimensions.width10/2),
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants.UPLOAD_URL +
                                                            getHistoryList[listCounter-1].img!)))):Container();
                                      })

                                  ),
                                  //total items clickhere
                                  Container(
                                    height: Dimensions.height40*2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SmallText(
                                          text: "Total",
                                          size: Dimensions.font16,
                                        ),
                                        Text(
                                        itemsPerOrder[i].toString() +
                                              " Items",
                                          style: TextStyle(
                                              fontSize: Dimensions.font20),
                                        ),
                                        Container(
                                          height: Dimensions.height30,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/2,vertical: Dimensions.height10/2),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: (){
                                                Get.toNamed(RouteHelper.getCardPage(i,"HistoryList"));
                                              },
                                              child: Text(
                                                "click here",
                                                style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontSize: Dimensions.font16),
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.mainColor,
                                                  width: Dimensions.width10/10.0),
                                              borderRadius:
                                              BorderRadius.circular(Dimensions.radius15/3)),
                                        )
                                      ],
                                    ),
                                  )


                              ]
                              )
                            ]),
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }));
  }
}


/* Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right:10),
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                                      image: DecorationImage(fit: BoxFit.cover,image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+historyList[index].img!))
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right:10),
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right:10),
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
                                    ),
                                  )
                                ],
                              ),

                              */
//total items clickhere


/*
 Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            historyList[i].time!,
                            style: TextStyle(fontSize: Dimensions.font20),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 90,
                                    width: 300,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: historyList.length,
                                      itemBuilder: (context, indexTwo) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius:
                                                  BorderRadiusDirectional.all(
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          historyList[i]
                                                              .img!))),
                                        );
                                      },
                                    )),
                                /* Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right:10),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                                    image: DecorationImage(fit: BoxFit.cover,image:NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+historyList[index].img!))
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right:10),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right:10),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
                                  ),
                                )
                              ],
                            ),

                            */
                                //total items clickhere
                                Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(
                                        text: "Total",
                                        size: Dimensions.font16,
                                      ),
                                      Text(
                                        historyList.length.toString() +
                                            " Items",
                                        style: TextStyle(
                                            fontSize: Dimensions.font20),
                                      ),
                                      Container(
                                        width: 70,
                                        height: 25,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "click here",
                                          style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontSize: Dimensions.font16),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.mainColor,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ],
                      ),
                      margin: EdgeInsets.only(
                        bottom: Dimensions.height20
                      ),
                    )
 */
