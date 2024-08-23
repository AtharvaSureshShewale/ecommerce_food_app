import 'dart:async';

import 'package:ecommerce_food_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_food_app/controllers/recommended_product_controller.dart';
import 'package:ecommerce_food_app/routes/route_helper.dart';
import 'package:ecommerce_food_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    super.initState();
    _loadResource();
    controller=AnimationController(
      vsync: this,
      duration:Duration(seconds: 2))..forward();

    animation=CurvedAnimation(
      parent: controller, 
      curve: Curves.linear);

    Timer(
      Duration(seconds: 3),
      ()=>Get.offNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFffb601),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset("assets/image/logo1.png",width: Dimensions.splashImg,)
              )
            ),
          Center(
            child: Image.asset("assets/image/logo2.png",width: Dimensions.splashImg,)
            ),
        ],
      ),
    );
  }
}