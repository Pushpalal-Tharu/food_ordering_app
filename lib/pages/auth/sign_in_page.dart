import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/base/custom_loader.dart';
import 'package:food_ordering_app/pages/auth/sign_up_page.dart';
import 'package:food_ordering_app/routes/route_helper.dart';
import 'package:food_ordering_app/widgets/app_text_field.dart';
import 'package:food_ordering_app/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address ",
            title: "Email address");
      }
      // else if (!GetUtils.isEmail(email)) {
      //   showCustomSnackBar("Type in your valid email address ",
      //       title: "Valid email address");
      // }
      else if (password.isEmpty) {
        showCustomSnackBar("Type in your password ", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters ",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/image/logo part 1.png"),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome!",
                              style: TextStyle(
                                fontSize: Dimensions.font20 * 1.8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sign into your account",
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //your phone
                      AppTextField(
                        textController: emailController,
                        hintText: "Email",
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //your password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                            text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign in
                      GestureDetector(
                        onTap: () {
                          // Get.to(() => HomePage(), transition: Transition.fade);

                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign In",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),

                      RichText(
                        text: TextSpan(
                            text: "Don\'t have an account?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUpPage(),
                                      transition: Transition.fade),
                                text: "Create",
                                style: TextStyle(
                                  color: AppColors.mainBlackColor,
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        },
      ),
    );
  }
}
