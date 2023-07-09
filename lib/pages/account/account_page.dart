import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/appIcon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Profile',size: 24,color:Colors.white),),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile Icon
            AppIcon(icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              size: Dimensions.height15*10,
            iconSize: Dimensions.height45+Dimensions.height30,),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Name
                    AccountWidget(appIcon:  AppIcon(icon: Icons.person,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "Zakariya",)),
                    SizedBox(height: Dimensions.height20,),
                    //phone
                    AccountWidget(appIcon:  AppIcon(icon: Icons.phone,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "176 20959001",)),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(appIcon:  AppIcon(icon: Icons.email,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "zk.alzeidi@gmail.com",)),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(appIcon:  AppIcon(icon: Icons.location_on,
                      backgroundColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "Fill in your address",)),
                    SizedBox(height: Dimensions.height20,),
                    //message
                    AccountWidget(appIcon:  AppIcon(icon: Icons.message_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "messages",)),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon:  AppIcon(icon: Icons.logout,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      size: Dimensions.height10*5,
                      iconSize: Dimensions.height10*5/2,) , bigText: BigText(text: "logout",)),
                    SizedBox(height: Dimensions.height20,),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
