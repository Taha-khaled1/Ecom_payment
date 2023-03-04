import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';

import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/localization_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/not_loggedin_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/widget/wishlist_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  bool isGuestMode;

  @override
  void initState() {
    super.initState();
    isGuestMode = !Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          CustomAppBar(title: getTranslated('wishList', context)),

          Expanded(
            child: isGuestMode ? NotLoggedInWidget() :  Consumer<WishListProvider>(
              builder: (context, wishListProvider, child) {
                return wishListProvider.wishList != null ? wishListProvider.wishList.length > 0 ? RefreshIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  onRefresh: () async {
                    await  Provider.of<WishListProvider>(context, listen: false).initWishList(
                      context, Provider.of<LocalizationProvider>(context, listen: false).locale.countryCode,
                    );
                  },

                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: wishListProvider.wishList.length,
                    itemBuilder: (context, index) => WishListWidget(
                      product: wishListProvider.wishList[index],
                      index: index,
                    ),
                  ),
                ) : NoInternetOrDataScreen(isNoInternet: false): WishListShimmer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FavouritesContainerOffWidget extends StatelessWidget {
  String image;
  String productname;
  String categoryname;
  String productprice;
  String discount;

  FavouritesContainerOffWidget({
    @required this.image,
    @required this.productname,
    @required this.categoryname,
    @required this.productprice,
    @required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 91,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(Images.onboarding_screen3),
                              fit: BoxFit.cover)
                              
                              
                              ),
                    ),
                    Container(
                      height: 22,
                      width: 61,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(11),
                            topLeft: Radius.circular(11),
                          ),
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
                          discount,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productname,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3,
                      ),

                      Text(
                        categoryname,
                        style:
                            TextStyle(color: Color(0xff6E80B0), fontSize: 11),
                      ),
                      Spacer(),
                      Text(
                        productprice,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xffDAA50F),
                        ),
                      ),

                      //   Row(
                      //     children: [ Text('Kids suite',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),

                      // Icon(Icons.stars,color: Colors.yellow,),],
                      //   )
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffDAA50F),
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffDAA50F),
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffDAA50F),
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffDAA50F),
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffDAA50F),
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '(20)',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}


class WishListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled: Provider.of<WishListProvider>(context).wishList==null,
          child: ListTile(
            leading: Container(height: 50, width: 50, color: ColorResources.WHITE),
            title: Container(height: 20, color: ColorResources.WHITE),
            subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(height: 10, width: 70, color: ColorResources.WHITE),
              Container(height: 10, width: 20, color: ColorResources.WHITE),
              Container(height: 10, width: 50, color: ColorResources.WHITE),
            ]),
            trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(height: 15, width: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: ColorResources.WHITE)),
              SizedBox(height: 10),
              Container(height: 10, width: 50, color: ColorResources.WHITE),
            ]),
          ),
        );
      },
    );
  }
}
