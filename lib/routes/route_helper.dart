

import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/food/papular_food_detail.dart';

class RouteHelper{
  static const  String initial= "/";
  static const String popularFood= "/popular-food";

  static String getInitial()=> '$initial';
  static String getPopularFood()=> '$popularFood';


  static List<GetPage> routes= [
    GetPage(name: initial, page: ()=> MainFoodPage()),


    GetPage(name: popularFood, page: (){
    print("popular food get called");
    return PopularFoodDetail();}, transition: Transition.fadeIn)
  ];
}