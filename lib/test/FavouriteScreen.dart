import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/localization_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/not_loggedin_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/widget/wishlist_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import '../view/basewidget/no_internet_screen.dart';
import '../view/screen/home/widget/banners_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isGuestMode;

  @override
  void initState() {
    super.initState();
    isGuestMode =
        !Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  Spacer(),
                  Text(
                    'Favourite',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BannersView(),
              Container(
                child: isGuestMode
                    ? NotLoggedInWidget()
                    : Consumer<WishListProvider>(
                        builder: (context, wishListProvider, child) {
                          return wishListProvider.wishList != null
                              ? wishListProvider.wishList.length > 0
                                  ? 
                                  RefreshIndicator(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      onRefresh: () async {
                                        await Provider.of<WishListProvider>(
                                                context,
                                                listen: false)
                                            .initWishList(
                                          context,
                                          Provider.of<LocalizationProvider>(
                                                  context,
                                                  listen: false)
                                              .locale
                                              .countryCode,
                                        );
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.all(0),
                                        itemCount: wishListProvider
                                            .wishList.length,
                                        itemBuilder: (context, index) =>
                                            FavouritesContainerOffWidget(
                                          product: wishListProvider
                                              .wishList[index],
                                          index: index,
                                        ),
                                      ),
                                    )
                                  : NoInternetOrDataScreen(
                                      isNoInternet: false)
                              : WishListShimmer();
                        },
                      ),
              ),
            ],
          ),
        ));
  }
}

class FavouritesContainerOffWidget extends StatelessWidget {
  final Product product;
  final int index;

  FavouritesContainerOffWidget({
    @required this.product,
    @required this.index,
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
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        fit: BoxFit.scaleDown,
                        width: 80,
                        height: 80,
                        image:
                            '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${product.thumbnail}',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                            Images.placeholder,
                            fit: BoxFit.scaleDown,
                            width: 80,
                            height: 80),
                      ),
                    ),

                     product.unitPrice!=null && product.discount>0? 
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
                        child:Text(product.unitPrice!=null && product.discount != null && product.discountType != null?
                          PriceConverter.percentageCalculation(context, product.unitPrice, product.discount, product.discountType) : '',
                            style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                color: Theme.of(context).cardColor),
                          ),
                      ),
                    ):SizedBox(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                   product.name ?? '',maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        height: 3,
                      ),

                      Text(
                        product.name,
                        style:
                            TextStyle(color: Color(0xff6E80B0), fontSize: 11),
                      ),
                      Spacer(),
                      Text(
                     PriceConverter.convertPrice(context, product.unitPrice,
                              discount: product.discount,discountType: product.discountType),
                              maxLines: 1,overflow: TextOverflow.ellipsis,
                           
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
                    GestureDetector(
                      onTap: (){
                         showDialog(context: context, builder: (_) => new CupertinoAlertDialog(
                                  title: new Text(getTranslated('ARE_YOU_SURE_WANT_TO_REMOVE_WISH_LIST', context)),
                                  actions: <Widget>[
                                    TextButton(child: Text(getTranslated('YES', context)),
                                      onPressed: () {
                                        Provider.of<WishListProvider>(context, listen: false).removeWishList(product.id, index: index);
                                        Navigator.of(context).pop();
                                      },
                                    ),

                                    TextButton(child: Text(getTranslated('NO', context)),
                                      onPressed: ()  => Navigator.of(context).pop(),
                                    ),
                                  ],
                                ));
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
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
