import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/products_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items= {};

  void addItem(ProductModel product, int quantity){
    _items.putIfAbsent(key, () => null)
  }

}