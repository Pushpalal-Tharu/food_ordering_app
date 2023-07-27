import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/pages/auth/sign_up_page.dart';
import 'package:food_ordering_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetBuilder<CartController>(builder: (_) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Food app',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: SignUpPage(),
                // home: SplashScreen(),
                // initialRoute: RouteHelper.getSplashPage(),
                // getPages: RouteHelper.routes,
              );
            });
          },
        );
      },
    );
  }
}
