import 'package:flutter/material.dart';
import 'package:food_delivery/auth/sign_in_page.dart';
import 'package:food_delivery/auth/sign_up_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_popular_controller.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
          //initialRoute: RouteHelper.getSplashScreen(),
          //getPages:RouteHelper.routes,
        );
      });
    });
  }
}