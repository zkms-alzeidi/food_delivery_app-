
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_popular_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override 
  void initState() {
    super.initState();
    _loadResource();
    controller= new AnimationController(vsync: this,duration: const Duration(seconds: 1))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(Duration(seconds: 2), ()=> Get.offNamed(RouteHelper.getInitial()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(child: Center(child: Image.asset("assets/image/logo.png", width: Dimensions.splashImg)),scale: animation,),
          Center(child: Text("طرش", style: TextStyle(fontSize: Dimensions.font26, color: Colors.green),))
        ],
      ),
    );
  }
}
