import 'package:flutter/material.dart';
import 'package:food_ordering_app/base/no_data_page.dart';
import 'package:food_ordering_app/base/show_custom_snackbar.dart';
import 'package:food_ordering_app/controllers/auth_controller.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/location_controller.dart';
import 'package:food_ordering_app/controllers/order_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/controllers/recommended_product_controller.dart';
import 'package:food_ordering_app/controllers/user_controller.dart';
import 'package:food_ordering_app/models/place_order_model.dart';
import 'package:food_ordering_app/routes/route_helper.dart';
import 'package:food_ordering_app/utils/app_constants.dart';
import 'package:food_ordering_app/utils/colors.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
import 'package:food_ordering_app/widgets/app_icon.dart';
import 'package:food_ordering_app/widgets/big_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  size: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    size: Dimensions.iconSize24,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  size: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Positioned(
                      top: Dimensions.height20 * 3,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GetBuilder<CartController>(
                              builder: (cartController) {
                                var _cartList = cartController.getItems;
                                return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: double.maxFinite,
                                      height: Dimensions.height20 * 5,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var popularIndex = Get.find<
                                                      PopularProductController>()
                                                  .popularProductList
                                                  .indexOf(_cartList[index]
                                                      .producut!);

                                              if (popularIndex >= 0) {
                                                Get.toNamed(
                                                    RouteHelper.getPopularFood(
                                                        popularIndex,
                                                        "cartPage"));
                                              } else {
                                                var recommendedIndex = Get.find<
                                                        RecommendedProductController>()
                                                    .recommendedProductList
                                                    .indexOf(_cartList[index]
                                                        .producut!);
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar(
                                                    "History product",
                                                    "Product review is not available for history products.",
                                                    backgroundColor:
                                                        AppColors.mainColor,
                                                  );
                                                } else {
                                                  Get.toNamed(RouteHelper
                                                      .getRecommendedFood(
                                                          recommendedIndex,
                                                          "cartPage"));
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: Dimensions.height20 * 5,
                                              height: Dimensions.height20 * 5,
                                              margin: EdgeInsets.only(
                                                top: Dimensions.height10,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20),
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img
                                                              .toString(),
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: Colors.black54,
                                                ),
                                                SmallText(
                                                  text: "Spicy",
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: cartController
                                                          .getItems[index].price
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions
                                                              .height10,
                                                          bottom: Dimensions
                                                                  .height10 -
                                                              2,
                                                          left: Dimensions
                                                              .width10,
                                                          right: Dimensions
                                                              .width10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius20)),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .producut!,
                                                                    -1);
                                                              },
                                                              child: Icon(
                                                                  Icons.remove,
                                                                  color: AppColors
                                                                      .signColor)),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                          ),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .producut!,
                                                                    1);
                                                              },
                                                              child: Icon(
                                                                  Icons.add,
                                                                  color: AppColors
                                                                      .signColor)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            )),
                      ),
                    )
                  : NoDataPage(text: "Your cart is empty!");
            },
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
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
            child: cartController.getItems.length > 0
                ? Row(
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
                        child: Row(
                          children: [
                            BigText(
                              text: "\Rs " +
                                  cartController.totalAmount.toString(),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userLoggedIn()) {
                            print("logged in?");
                            // cartController.addToHistory();

                            if (Get.find<LocationController>()
                                .addressList
                                .isEmpty) {
                              Get.toNamed(RouteHelper.getAddressPage());
                            } else {
                              // Get.offNamed(RouteHelper.getInitial());
                              // Get.offNamed(
                              //   RouteHelper.getPaymentPage("100127",
                              //       Get.find<UserController>().userModel!.id),
                              // );
                              var location = Get.find<LocationController>()
                                  .getUserAddress();
                              var cart = Get.find<CartController>().getItems;
                              var user = Get.find<UserController>().userModel;
                              PlaceOrderBody placeOrder = PlaceOrderBody(
                                cart: cart,
                                orderAmount: 100,
                                distance: 10.0,
                                scheduleAt: '',
                                orderNote: "Note About the Food",
                                address: location.address,
                                latitude: location.latitude,
                                longitude: location.longitude,
                                contactPersonName: user!.name,
                                contactPersonNumber: user.phone,
                              );

                              Get.find<OrderController>()
                                  .placeOrder(placeOrder, _callback);
                            }
                          } else {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20 - 2,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: BigText(
                            text: "Check Out",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID) {
    if (isSuccess) {
      Get.find<CartController>().clear();
      Get.find<CartController>().removeCartSharedPreferences();
      Get.find<CartController>().addToHistory();
      Get.offNamed(RouteHelper.getPaymentPage(
          orderID, Get.find<UserController>().userModel!.id));
    } else {
      showCustomSnackBar(message);
    }
  }
}
