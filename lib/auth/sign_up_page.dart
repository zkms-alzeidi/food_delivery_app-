import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';


import '../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();


    var signUpImages=[
      "t.png",
      "f.png",
      "g.png"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight! * 0.05,),
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
            
            //Email
            AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimensions.height20,),

            //Password
            AppTextField(textController: passwordController, hintText: "Password", icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20,),

            //Name
            AppTextField(textController: nameController, hintText: "Name", icon: Icons.person),
            SizedBox(height: Dimensions.height20,),

            //Phone
            AppTextField(textController: phoneController, hintText: "Phone", icon: Icons.phone),
            SizedBox(height: Dimensions.height20,),
            
            Container(
              width: Dimensions.screenWidth!/2,
              height: Dimensions.screenHeight!/13,
              child: Center(child: BigText(text: "Sign up",size: Dimensions.font20+Dimensions.font10,color: Colors.white,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
              
            ),
            SizedBox(height: Dimensions.height10,),

            //Sign up button
            RichText(text: TextSpan(text: "Have an account already?",recognizer: TapGestureRecognizer()..onTap=()=> Get.back(), style: TextStyle(
              color: Colors.grey[500],
              fontSize: Dimensions.font20
            ))),
            SizedBox(height: Dimensions.screenHeight!*0.05,),

            //sign up options
            RichText(text: TextSpan(text: "Sign up using one of the following methods", style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font16
            ))),
            Wrap(
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: Dimensions.radius15*2,
                  backgroundImage: AssetImage( "assets/image/"+signUpImages[index]),
                  backgroundColor: Colors.white,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
