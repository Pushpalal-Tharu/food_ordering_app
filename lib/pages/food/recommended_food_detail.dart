import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/colors.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
import 'package:food_ordering_app/widgets/app_icon.dart';
import 'package:food_ordering_app/widgets/big_text.dart';
import 'package:food_ordering_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.add_shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Center(
                    child: BigText(
                  text: "Chinese Side",
                  size: Dimensions.font26,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
              preferredSize: Size.fromHeight(20),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                      text:
                          "With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance. With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance. With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance.With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance.With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance. With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance.With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance.With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance.With a long history, unique features, numerous styles, and exquisite cooking, Chinese cuisine is one of the important constituent parts of Chinese culture. Chinese traditional dishes are famous for their color, aroma, taste, meanings, and appearance."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20 - 2,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20 - 2,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
