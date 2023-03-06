import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  final int initialPage;
  AuthScreen({this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false)
        .initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController _pageController = PageController(initialPage: initialPage);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Provider.of<ThemeProvider>(context).darkTheme
              ? SizedBox()
              : Image.asset(Images.background,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),
          Consumer<AuthProvider>(
            builder: (context, auth, child) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.topSpace),
                  Image.asset(Images.logo_black, height: 108, width: 120),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 0,
                        right: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: ColorResources.getGainsBoro(context),
                        ),
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, child) => Container(
                          height: 80,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0XFF696969),
                                  Color(0XFF696969),
                                  Color.fromARGB(255, 148, 143, 143),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => _pageController.animateToPage(0,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOut),
                                  child: Column(
                                    children: [
                                      Text(
                                        getTranslated('SIGN_IN', context),
                                        style: authProvider.selectedIndex == 0
                                            ? titilliumSemiBold.copyWith(
                                                color: Colors.white)
                                            : titilliumRegular.copyWith(
                                                color: Colors.white),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 40,
                                        margin: EdgeInsets.only(top: 8),
                                        color: authProvider.selectedIndex == 0
                                            ? Color(0xffDAA50F)
                                            : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 130,
                                ),
                                SizedBox(
                                    width: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                InkWell(
                                  onTap: () => _pageController.animateToPage(1,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOut),
                                  child: Column(
                                    children: [
                                      Text(
                                        getTranslated(
                                          'SIGN_UP',
                                          context,
                                        ), // Here Asim
                                        style: authProvider.selectedIndex == 1
                                            ? titilliumSemiBold.copyWith(
                                                color: Colors.white.withOpacity(
                                                  0.5,
                                                ),
                                              )
                                            : titilliumRegular.copyWith(
                                                color: Colors.white.withOpacity(
                                                  0.5,
                                                ),
                                              ),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 50,
                                        margin: EdgeInsets.only(top: 8),
                                        color: authProvider.selectedIndex == 1
                                            ? Color(0xffDAA50F)
                                            : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Consumer<AuthProvider>(
                      builder: (context, authProvider, child) =>
                          PageView.builder(
                        itemCount: 2,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          if (authProvider.selectedIndex == 0) {
                            return SignInWidget();
                          } else {
                            return SignUpWidget();
                          }
                        },
                        onPageChanged: (index) {
                          authProvider.updateSelectedIndex(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
