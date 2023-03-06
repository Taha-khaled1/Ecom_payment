import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class NotLoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.mobile_login),
          Text(
            'Please login first to continue',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            'Because you are now in quest mode',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false)
                  .updateSelectedIndex(0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthScreen(initialPage: 0)));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffDAA50F),
                      Color(0xffDAA000),
                    ],
                  )),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false)
                  .updateSelectedIndex(1);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthScreen(initialPage: 1)));
            },
            child: Text(
              'create new account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xff3B97D3)),
            ),
          ),
        ],
      ),
    );

    //  Padding(
    //     padding: EdgeInsets.all(_height*0.025),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.asset(Images.login, height: _height*0.2, width: _width),
    //         SizedBox(height: _height*0.05),
    //         Text(getTranslated('PLEASE_LOGIN_FIRST', context), textAlign: TextAlign.center, style: titilliumSemiBold.copyWith(fontSize: _height*0.017)),
    //         SizedBox(height: _height*0.05),
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
    //           child: Container(
    //             width: MediaQuery.of(context).size.width/2,
    //             child: CustomButton(
    //               buttonText: getTranslated('LOGIN', context),
    //               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen())),
    //             ),
    //           ),
    //         ),
    //         InkWell(
    //           onTap: () {
    //             Provider.of<AuthProvider>(context, listen: false).updateSelectedIndex(1);
    //             Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(initialPage: 1)));
    //           },
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(vertical: _height*0.02),
    //             child: Text(getTranslated('create_new_account', context), style: titilliumRegular.copyWith(
    //               color: Color(0xffDAA50F),
    //               fontSize: Dimensions.FONT_SIZE_SMALL,
    //             )),
    //           ),
    //         ),
    //       ],
    //     ));
  }
}
