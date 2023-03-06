import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/helper/network_info.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/test/FavouriteScreen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/chat/inbox_screen.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/home_screens.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/more/more_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/notification/notification_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_screen.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
    singleVendor = Provider.of<SplashProvider>(context, listen: false)
            .configModel
            .businessMode ==
        "single";

    _screens = [
      HomePage(),
      OrderScreen(isBacButtonExist: false),
      NotificationScreen(isBacButtonExist: false),
      MoreScreen(),
      // singleVendor?OrderScreen(isBacButtonExist: false): InboxScreen(isBackButtonExist: false) ,
      // singleVendor? NotificationScreen(isBacButtonExist: false): OrderScreen(isBacButtonExist: false),
      // singleVendor? MoreScreen(): NotificationScreen(isBacButtonExist: false),
      // singleVendor?SizedBox(): MoreScreen(),
    ];
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: WaterDropNavBar(
          waterDropColor: Color(0XFF696969),
          selectedIndex: _pageIndex,
          barItems: _getBottomWidget(singleVendor),
          onItemSelected: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BarItem _barItem(IconData outlinedicon, IconData filledicon, int index) {
    return BarItem(
      outlinedIcon: outlinedicon,
      // Image.asset(icon, color: index == _pageIndex ?
      // Color(0xffDAA50F) : Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
      //   height: 25, width: 25,
      // ),
      filledIcon: filledicon,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  List<BarItem> _getBottomWidget(bool isSingleVendor) {
    List<BarItem> _list = [];

    if (!isSingleVendor) {
      _list.add(_barItem(Icons.home_outlined, Icons.home, 0));
      _list.add(_barItem(LineIcons.shoppingCart, Icons.shopping_cart, 1));
      _list.add(_barItem(Icons.favorite_outline, Icons.favorite, 2));
      _list.add(_barItem(Icons.person_outlined, Icons.person, 3));
      // _list.add(_barItem(Icons.home, Icons.home, 4));

      // _list.add(_barItem(Icons.home, getTranslated('home', context), 0));
      // _list.add(_barItem(Images.message_image, getTranslated('inbox', context), 1));
      // _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 2));
      // _list.add(_barItem(Images.notification, getTranslated('notification', context), 3));
      // _list.add(_barItem(Images.more_image, getTranslated('more', context), 4));
    } else {
      _list.add(_barItem(Icons.home_outlined, Icons.home, 0));
      _list.add(_barItem(LineIcons.shoppingCart, Icons.shopping_cart, 1));
      _list.add(_barItem(Icons.favorite_outline, Icons.favorite, 2));
      _list.add(_barItem(Icons.person_outlined, Icons.person, 3));

      // _list.add(_barItem(Images.home_image, getTranslated('home', context), 0));
      // _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 1));
      // _list.add(_barItem(Images.notification, getTranslated('notification', context), 2));
      // _list.add(_barItem(Images.more_image, getTranslated('more', context), 3));
    }

    return _list;
  }
}
