import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items= {};
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems= [];
  List<CartModel> historyItems= [];









  void addItem(ProductModel product, int quantity){

    var totalQuantity=0;

    if(_items.containsKey(product.id))
    {
      _items.update(product.id!, (value) {
        totalQuantity= value.quantity!+quantity;
        if(totalQuantity>20){
          Get.snackbar("Item count", "You can't add more than 20!", backgroundColor: AppColors.wrongColor,colorText: Colors.white);
          quantity=0;
        }



        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity!+quantity,
            isExist: true,
            time:DateTime.now().toString(),
          product: 
            product,

        );
      }
      );
      if(totalQuantity<= 0){
        _items.remove(product.id);
      }

    }
    else
    {
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time:DateTime.now().toString(),
              product: product);
        });
      }
      else
      {
        Get.snackbar("Item count", "You should add an item in the cart!", backgroundColor: AppColors.wrongColor,colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();



  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    else
    {
      return false;
    }
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(value.id == product.id)
        {
          quantity= value.quantity!;
        }
      });
    }

    return quantity;
  }

  int get totalItems{
    var totalQuantity= 0;
    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });
    return totalQuantity;
  }


  List<CartModel> get getItems{
    return _items.entries.map((e) =>
    e.value).toList();
  }
  int get totalAmount{
    int totalAmount=0;
    _items.forEach((key, value) {
      totalAmount+=(value.price!*value.quantity!);
    });
    return totalAmount;
  }


  List<CartModel> getCartData(){
    setCart= cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items){
    storageItems = items;
    print("the StorageData" + storageItems.toString());

    for(int i=0; i<storageItems.length;  i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
      print("Done with the StorageData");
    }
  }

  List<CartModel> getHistoryData(){
    setHistory= cartRepo.getHistoryList();
    return historyItems;
  }

  set setHistory(List<CartModel> items){
    historyItems= items;
  }

  void addToHistory(List<CartModel> items){
    cartRepo.addToHistoryList();
    _items.clear();
    update();
  }

  List<CartModel> getHistoryList(){
    return cartRepo.getHistoryList();
  }


}
