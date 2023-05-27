import 'package:flutter/cupertino.dart';

class NoDataPage  extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage ({Key? key,required this.text
  ,this.imgPath="assets/image/"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
