import 'dart:convert';

import 'package:food_delivery/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';
import '../../utils/app_constants.dart';

class CartRepo{

  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory= [];


  void addToCartList(List<CartModel> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart=[];

    /*
    convert objects to String bcs shared reference only accept String
     */

    cartList.forEach((element){

      element.time= time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.Cart_List));
    getCartList();
  }

  List<CartModel> getCartList(){

    List<String> carts=[];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList "+ carts.toString()
      );
    }
    List<CartModel> cartList=[];
    /*
    convert the Json to CartModel
     */
    carts.forEach((element)=> cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }



  void addToHistoryList(){
    cartHistory=[];
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory= sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    //convert to string
    cart.forEach((element) {
      cartHistory.add(element);
    });
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    print("the History length is : "+getHistoryList().length.toString());
    for( int i= 0; i< getHistoryList().length; i++){
      print("hte time for the order is: "+ getHistoryList()[i].time.toString());
    }
  }

  List<CartModel> getHistoryList(){
    List<CartModel> historyItems= [];

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory=[];
      cartHistory= sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      print("the items: "+ cartHistory.toString());

    }
    cartHistory.forEach((element) {
      historyItems.add(CartModel.fromJson(jsonDecode(element)));
    });
    return historyItems;
  }



  void removeCart() {
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

}