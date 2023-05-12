import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color color;
  String text;
  double size;
  double height;
  TextOverflow overFlow;
  int maxLine;



  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
        this.maxLine= 2,
      this.height = 1.2,

      this.overFlow= TextOverflow.ellipsis})
      : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
          color: color, fontFamily: "Roboto", fontSize: size==0?Dimensions.font12 : size, height: height,),
    );
  }
}
