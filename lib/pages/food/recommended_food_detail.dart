import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
      SliverAppBar(
        toolbarHeight: 80,
        pinned: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: Icons.clear),
            AppIcon(icon: Icons.shopping_cart_outlined),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            child: Center(
                child: BigText(
              text: "Sliver app bar",
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
          background: Image.asset("assets/image/burger.jpg",
              width: double.maxFinite, fit: BoxFit.cover),
        ),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            Container(

              child: ExpandableTextWidget(
                text:
                    "My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to the My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website.This error looks strange as I haven't found anything on google or stackoverflow similar to this. zakariya is the best one in the world.",
              ),
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            ),
          ],
        ),
      ),
    ]),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                AppIcon(iconColor: Colors.white,backgroundColor:AppColors.mainColor,icon: Icons.remove),
                AppIcon(iconColor: Colors.white,backgroundColor:AppColors.mainColor,icon: Icons.remove),
              ],
            )
          ],
        ),

    );
  }
}
