import 'package:food_delivery/cart/cart_page.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/food/papular_food_detail.dart';
import '../pages/splash/splash_screen.dart';

class RouteHelper {
  static const String splashScreen= "/splash_screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage= "/cart-list";



  static String getSplashScreen()=> '$splashScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';

  static String getCardPage(int pageId, String page)=> '$cartPage?pageId=$pageId&page=$page';
  static List<GetPage> routes = [

    GetPage(name: splashScreen, page: ()=>SplashScreen()),
    GetPage(name: initial,
        page: () => HomePage(),
        transition: Transition.fadeIn),

    GetPage(
        name: cartPage,
        page: ()  {
          var pageId= Get.parameters['pageId'];
          var page=  Get.parameters['page'];
          return CartPage(pageId: int.parse(pageId!),page:page!,);
  },
        transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          var pageId= Get.parameters['pageId'];
          var page= Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!),page: page!,);
        },
        transition: Transition.fadeIn),

    GetPage(
        name: recommendedFood,
        page: () {
          var pageId= Get.parameters['pageId'];
          var page= Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!),page:page!);
        },
        transition: Transition.fadeIn),

  ];
}
