import 'package:flutter/material.dart';
import 'package:food_ordering_app/base/custom_app_bar.dart';
import 'package:food_ordering_app/controllers/auth_controller.dart';
import 'package:food_ordering_app/controllers/order_controller.dart';
import 'package:food_ordering_app/pages/order/view_order.dart';
import 'package:food_ordering_app/utils/colors.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My orders"),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: AppColors.yellowColor,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Current",
                ),
                Tab(
                  text: "History",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ViewOrder(
                  isCurrent: true,
                ),
                ViewOrder(
                  isCurrent: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
