import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/burger.jpg",
                  width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Text("My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this.My code is exactly the same as found on the linked website. This error looks strange as I haven't found anything on google or stackoverflow similar to this."),
          )
        ],
      ),
    );
  }
}
