import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  double iconSize;
  double textSize;

   IconAndTextWidget({Key? key, required this.icon, required  this.text, required this.iconColor, this.iconSize=0, this.textSize=0,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size : iconSize==0?Dimensions.iconSize23:iconSize),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text, size: textSize,)
      ],
    );
  }
}
