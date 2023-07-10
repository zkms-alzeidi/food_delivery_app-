import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/auth/sign_up_page.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';


import '../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();



    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight! * 0.05,),

            //LOGO
            Container(
              height: Dimensions.screenHeight! * 0.25,
              child: Center(
                child:Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/image/logo.png")),
                  ),
                ),

              ),
            ),


            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello", style: TextStyle(fontSize: Dimensions.font20*3+Dimensions.font10,fontWeight: FontWeight.bold),),
                  Text("Sign into your account", style: TextStyle(fontSize: Dimensions.font20,color: Colors.grey[500]),),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            //Email
            AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimensions.height20,),

            //Password
            AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20,),


            SizedBox(height: Dimensions.height10,),

            //Sign up button
            Row(

              children: [
                Expanded(child: Container()),
                RichText(text: TextSpan(text: "Sign into your account", style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                ))),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(height: Dimensions.screenHeight!*0.05,),
            Container(
              width: Dimensions.screenWidth!/2,
              height: Dimensions.screenHeight!/13,
              child: Center(child: BigText(text: "Sign in",size: Dimensions.font20+Dimensions.font10,color: Colors.white,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),

            ),
            SizedBox(height: Dimensions.screenHeight!*0.05,),

            //sign up options
            RichText(text: TextSpan(text: "Don\'t have an account? ", style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font20
            ), children: [
                TextSpan(recognizer:TapGestureRecognizer()..onTap=()=>Get.to(()=> SignUpPage(), transition: Transition.fade),text: "Create", style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                    ,fontWeight: FontWeight.bold
                ))
            ])),
          ],
        ),
      ),
    );
  }
}
