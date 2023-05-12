
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_popular_controller.dart';
import '../data/repository/recommended_product_repo.dart';


Future<void> init() async{
  //shared preferences
  final sharedPreferences= await SharedPreferences.getInstance();
  Get.lazyPut(()=> sharedPreferences);
  //apiClient
  Get.lazyPut(()=> ApiClient(appBaseUrl:AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // the name should be same apiClient to find him
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> CartRepo(sharedPreferences: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}