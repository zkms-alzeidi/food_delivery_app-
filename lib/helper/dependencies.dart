import 'package:food_delivery/controllers%20/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';


Future<void> init() async{
  //apiClient
  Get.lazyPut(()=> ApiClient(appBaseUrl:"https://www.dbestech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); // the name should be same apiClient to find him

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}