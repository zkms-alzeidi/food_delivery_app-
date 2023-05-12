import 'package:get/get.dart';

class Dimensions{

 static double? screenHeight = Get.context?.height;
 static double? screenWidth = Get.context?.width;

 //dynamic height
 static double pageView = screenHeight!/2.64;
 static double pageViewContainer = screenHeight!/3.84;
 static double pageViewTextContainer = screenHeight!/7.03;

 //dynamic height padding and margin
 static double height10 = screenHeight!/75.9;
 static double height15 = screenHeight!/50.61;
 static double height20= screenHeight!/37.9;
 static double height30 = screenHeight!/26.90;
 static double height40 = screenHeight!/20.17;
 static double height45= screenHeight!/16.87;
 static double height100= screenHeight!/8.07;
 static double height120= screenHeight!/6.7;


 //fonts
 static double font20 = screenHeight!/37.9;
 static double font12 = screenHeight!/63.2;
 static double font10 = screenHeight!/75.9;
 static double font16 =screenHeight!/50.43;
 static double font26 = screenHeight!/31.03;


 //Radius
 static double radius15 = screenHeight!/50.61;
 static double radius20 = screenHeight!/37.9;


 //Dynamic width padding and margin
 static double width5= screenWidth!/78.54;
 static double width10 = screenWidth!/39.272;
 static double width15 = screenWidth!/26.18;
 static double width20= screenWidth!/19.63;
 static double width30= screenWidth!/13;
 static double width40 = screenWidth!/9.8;
 static double width45= screenWidth!/8.72;
 static double width120= screenWidth!/3.272;

 //Icon Size
 static double iconSize23 = screenHeight!/33.011;
 static double iconSize27 = screenHeight!/28.12;
 static double iconSize17 = screenHeight!/44.66;
 static double iconSize40 = screenHeight!/21;


 //Popular food
 static double popularFoodImgSize = screenHeight!/2.3;


 //Bottom height
 static double bottomHeightBar = screenHeight!/6.725;

 //splash screen dimensions
 static double splashImg= screenHeight!/4.37;

}