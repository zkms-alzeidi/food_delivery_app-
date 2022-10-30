import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  double iconSize= Dimensions.iconSize23;
  double textSize= Dimensions.font12;

   IconAndTextWidget({Key key, @required this.icon, @required  this.text, @required this.iconColor, this.iconSize, this.textSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size : iconSize),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text, size: textSize,)
      ],
    );
  }
}
