import 'package:flutter/material.dart';
import 'package:food_delivery/controllers%20/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems=0;
  int get inCartItems=> _inCartItems+_quantity;
  late CartController _cart;
  CartController get cart=> _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print(_quantity);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }
  int checkQuantity(int quantity) {
    if ((inCartItems+quantity)< 0) {
      Get.snackbar("Item count", "You can't reduce more !", backgroundColor: AppColors.mainColor,colorText: Colors.white);
      return 0;
    } else if ((inCartItems+quantity) > 20) {
      Get.snackbar("Item count", "You can't add more !", backgroundColor: AppColors.mainColor,colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart, ProductModel product){
    _cart = cart;
    _inCartItems=0;
    _quantity=0;
    var exist= false;
    exist= _cart.existInCart(product);
    print("exist or not "+ exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("the quantity in the cart is "+ _inCartItems.toString());

    //if exist
    //get from storage _inCartItems=3

  }

  void addItem(ProductModel product){
    if(_quantity>0){
      _cart.addItem(product, _quantity);
      _quantity=0;
      _inCartItems= _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        print("The id is "+value.id.toString() +"The quantity is "+value.quantity.toString());
      });
      Get.snackbar("Item count", "You had add an item in the cart!", backgroundColor: AppColors.mainColor,colorText: Colors.white);
    }else
      {
        Get.snackbar("Item count", "You should add an item in the cart!", backgroundColor: AppColors.wrongColor,colorText: Colors.white);
      }
  }
}
