import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/dimensions.dart';

class paypalHomePage extends StatelessWidget {
/*  final String orderID;
  final int status;
  OrderSuccessPage({required this.orderID,required this.status});
*/

  @override
  Widget build(BuildContext context) {
    /*if(status == 0){
      Future.delayed(Duration(seconds: 1),(){

      });
    }*/
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/image/mail.png"),
          ]),
        ),
      ),
    );
  }
}
