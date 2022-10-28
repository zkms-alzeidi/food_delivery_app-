import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  //macht die andere aussehen
  PageController pageController= PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height= Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    print("height: " + Dimensions.screenHeight.toString() +"\n width: " + Dimensions.screenWidth.toString()
    );

    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page;
        //print('current value ' + _currPageValue.toString());

      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        //Das ist Die erste herozentile List
        Container(
        height: Dimensions.pageView
          ,
        child: PageView.builder(
          controller: pageController,
          itemCount: 5,
            itemBuilder: (context, position){
            return _buildPageItem(position);
        }),
      ),
    new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      activeColor: AppColors.mainColor
    ),
    )


      ]
    );
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix= new Matrix4.identity();

    if(index == _currPageValue.floor())
    {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if (index == _currPageValue.floor()+1)
    {
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageValue.floor()-1)
    {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      //Transform lass uns mit matrix arbeiten.
      transform: matrix,
      child: Stack(
        //Stack lass uns Widget ohne position machen .. das heißt , wir konnen eine andere Box auf Stack machen
        children:[
          Container(
            height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/image/burger.jpg"
                  )
              )
          ),
        ),
          //Align ist ein Box für Beschreibung des Bilds
          Align(
            //Align lass uns alignment benutzen
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,

              margin: EdgeInsets.only(left: Dimensions.width40, right: Dimensions.width40, bottom: Dimensions.width30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]
              ),
              //diese Container hat die Beschreibung des Bilds(text-bewertung-abstand)
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width15,right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.height15,))
                        ),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text:"1287"),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle, text: 'Normal', iconColor: AppColors.iconColor1),
                        IconAndTextWidget(icon: Icons.location_on, text: '1.7km', iconColor: AppColors.mainColor),
                        IconAndTextWidget(icon: Icons.access_time_rounded, text: '32min', iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),

          )]
      ),
    );
  }
}
