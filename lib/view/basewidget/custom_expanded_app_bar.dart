import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/not_loggedin_widget.dart';
import 'package:provider/provider.dart';

class CustomExpandedAppBar extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget bottomChild;
  final bool isGuestCheck;
  CustomExpandedAppBar(
      {@required this.title,
      @required this.child,
      this.bottomChild,
      this.isGuestCheck = false});

  @override
  Widget build(BuildContext context) {
    bool isGuestMode =
        !Provider.of<AuthProvider>(context, listen: false).isLoggedIn();

    return Scaffold(
      floatingActionButton: isGuestCheck
          ? isGuestMode
              ? null
              : bottomChild
          : bottomChild,
      body: Stack(children: [
        // Background
        Positioned(
            right: 0,
            left: 0,
            top: -65,
            child: Image.asset('assets/images/Group 2.png')),

        Positioned(
          top: 36,
          left: Dimensions.PADDING_SIZE_SMALL,
          right: Dimensions.PADDING_SIZE_SMALL,
          child: Row(children: [
            CupertinoNavigationBarBackButton(
                color: Colors.black,
                onPressed: () {
                  Provider.of<SplashProvider>(context, listen: false)
                      .setFromSetting(false);
                  Navigator.pop(context);
                }),
            // Text(title,
            //     style: titilliumRegular.copyWith(
            //       fontSize: 20,
            //       color: Colors.black,
            //     ),
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis),
          ]),
        ),

        Container(
          margin: EdgeInsets.only(top: 90),
          decoration: BoxDecoration(
            color: ColorResources.getHomeBg(context),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: isGuestCheck
              ? isGuestMode
                  ? NotLoggedInWidget()
                  : child
              : child,
        ),
      ]),
    );
  }
}
