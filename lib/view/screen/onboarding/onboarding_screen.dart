import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/onboarding_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/auth_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  final Color indicatorColor;
  final Color selectedIndicatorColor;

  OnBoardingScreen({
    this.indicatorColor = Colors.grey,
    this.selectedIndicatorColor = Colors.black,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initBoardingList(context);

    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Provider.of<ThemeProvider>(context).darkTheme
              ? SizedBox()
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Consumer<OnBoardingProvider>(
                    builder: (context, onBoardingList, child) => ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.74,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            itemCount: onBoardingList.onBoardingList.length,
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          onBoardingList
                                              .onBoardingList[index].imageUrl,
                                        ),
                                        fit: BoxFit.cover)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      Images.logo_white,
                                      height: 105,
                                      width: 117,
                                    ),
                                    Spacer(),
                                    Text(
                                        onBoardingList
                                            .onBoardingList[index].title,
                                        style: titilliumBold.copyWith(
                                            fontSize: 28),
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            },
                            onPageChanged: (index) {
                              onBoardingList.changeSelectIndex(index);
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _pageIndicators(
                                    onBoardingList.onBoardingList, context),
                              ),
                            ),
                            Container(
                              height: 45,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: TextButton(
                                onPressed: () {
                                   if (!Provider.of<AuthProvider>(context, listen: false)
                        .isLoading) {
                      Provider.of<CartProvider>(context, listen: false)
                          .getCartData();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => DashBoardScreen()),
                          (route) => false);
                    }
                                  // if (Provider.of<OnBoardingProvider>(context,
                                  //             listen: false)
                                  //         .selectedIndex ==
                                  //     onBoardingList.onBoardingList.length -
                                  //         1) {
                                  //   Provider.of<SplashProvider>(context,
                                  //           listen: false)
                                  //       .disableIntro();
                                  //   Navigator.of(context).pushReplacement(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               AuthScreen()));
                                  // } else {
                                  //   _pageController.animateToPage(
                                  //       Provider.of<OnBoardingProvider>(context,
                                  //                   listen: false)
                                  //               .selectedIndex +
                                  //           1,
                                  //       duration: Duration(milliseconds: 300),
                                  //       curve: Curves.easeInOut);
                                  // }
                                },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text('Sign as a Guest',
                                      style: titilliumSemiBold.copyWith(
                                          color: Colors.black,
                                          fontSize:
                                              Dimensions.FONT_SIZE_LARGE)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));
                               
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all()),
                                child: Center(
                                    child: Text('Sign in',
                                        style: titilliumSemiBold.copyWith(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.FONT_SIZE_LARGE))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                 Provider.of<AuthProvider>(context, listen: false).updateSelectedIndex(1);
            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(initialPage: 1)));;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(colors: [
                                      Colors.grey,
                                      Colors.black,
                                    ])),
                                child: Center(
                                    child: Text('Sign Up',
                                        style: titilliumSemiBold.copyWith(
                                            color: Colors.white,
                                            fontSize:
                                                Dimensions.FONT_SIZE_LARGE))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  List<Widget> _pageIndicators(var onBoardingList, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: i == Provider.of<OnBoardingProvider>(context).selectedIndex
              ? 18
              : 7,
          height: 7,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: i == Provider.of<OnBoardingProvider>(context).selectedIndex
                ? Colors.black
                : Colors.grey,
            borderRadius:
                i == Provider.of<OnBoardingProvider>(context).selectedIndex
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return _indicators;
  }
}
