import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/brand_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/featured_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/flash_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/home_category_product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/top_seller_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/brand/all_brand_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/cart/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/featureddeal/featured_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/helpcenter/help_center_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/announcement.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/brand_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_deal_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/featured_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/flash_deals_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/footer_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/home_category_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/latest_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/main_section_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/flashdeal/flash_deal_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/recommended_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/top_seller_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/order/order_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/view_all_product_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/profile/profile_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/search_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/setting/settings_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/support/support_conversation_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/support/support_ticket_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/topSeller/all_top_seller_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

Color primery = Color(0xffDAA50F);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<BannerProvider>(context, listen: false)
        .getBannerList(reload, context);
    Provider.of<BannerProvider>(context, listen: false)
        .getFooterBannerList(context);
    Provider.of<BannerProvider>(context, listen: false)
        .getMainSectionBanner(context);
    Provider.of<CategoryProvider>(context, listen: false)
        .getCategoryList(reload, context);
    Provider.of<HomeCategoryProductProvider>(context, listen: false)
        .getHomeCategoryProductList(reload, context);
    Provider.of<TopSellerProvider>(context, listen: false)
        .getTopSellerList(reload, context);
    Provider.of<BrandProvider>(context, listen: false)
        .getBrandList(reload, context);
    Provider.of<ProductProvider>(context, listen: false)
        .getLatestProductList(1, context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false)
        .getFeaturedProductList('1', context, reload: reload);
    Provider.of<FeaturedDealProvider>(context, listen: false)
        .getFeaturedDealList(reload, context);
    Provider.of<ProductProvider>(context, listen: false)
        .getLProductList('1', context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false)
        .getRecommendedProduct(context);
  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    singleVendor = Provider.of<SplashProvider>(context, listen: false)
            .configModel
            .businessMode ==
        "single";
    Provider.of<FlashDealProvider>(context, listen: false)
        .getMegaDealList(true, context, true);

    _loadData(context, false);

    if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      Provider.of<CartProvider>(context, listen: false).uploadToServer(context);
      Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    } else {
      Provider.of<CartProvider>(context, listen: false).getCartData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    List<String> types = [
      getTranslated('new_arrival', context),
      getTranslated('top_product', context),
      getTranslated('best_selling', context),
      getTranslated('discounted_product', context)
    ];
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        width: 250,
        backgroundColor: Color(0xffF1F1F1),
        child: Container(
          //  alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Image.asset('assets/images/Group 2.png'),
              SizedBox(
                height: 15,
              ),
              ButommDrawer(
                image: 'assets/images/11.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                text: 'Search',
              ),
              ButommDrawer(
                image: 'assets/images/10.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                text: 'Home',
              ),
              ButommDrawer(
                image: 'assets/images/Vector.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllCategoryScreen(),
                    ),
                  );
                },
                text: 'Category',
              ),
              ButommDrawer(
                image: 'assets/images/2.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupportTicketScreen(),
                    ),
                  );
                },
                text: 'Support Ticket',
              ),
              ButommDrawer(
                image: 'assets/images/3.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishListScreen(),
                    ),
                  );
                },
                text: 'Favorites',
              ),
              ButommDrawer(
                image: 'assets/images/9.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                text: 'Profile',
              ),
              ButommDrawer(
                image: 'assets/images/4.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                text: 'Cart',
              ),
              ButommDrawer(
                image: 'assets/images/5.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ),
                  );
                },
                text: 'Orders',
              ),
              ButommDrawer(
                image: 'assets/images/6.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpCenterScreen(),
                    ),
                  );
                },
                text: 'FAQ',
              ),
              ButommDrawer(
                image: 'assets/images/7.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpCenterScreen(),
                    ),
                  );
                },
                text: 'Contact',
              ),
              ButommDrawer(
                image: 'assets/images/8.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Color(0xffDAA50F),
          onRefresh: () async {
            await _loadData(context, true);
            await Provider.of<FlashDealProvider>(context, listen: false)
                .getMegaDealList(true, context, false);

            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // App Bar
                  SliverAppBar(
                    floating: true,
                    elevation: 0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Theme.of(context).highlightColor,
                    title: Image.asset(
                      Images.logo_black,
                      height: 40,
                      width: 100,
                    ),
                    leading: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Search Button
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverDelegate(
                          child: InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchScreen())),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.HOME_PAGE_PADDING,
                              vertical: Dimensions.PADDING_SIZE_SMALL),
                          color: ColorResources.getHomeBg(context),
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: Dimensions.HOME_PAGE_PADDING,
                              right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            height: 60,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[
                                        Provider.of<ThemeProvider>(context)
                                                .darkTheme
                                            ? 900
                                            : 200],
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(
                                  Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(getTranslated('SEARCH_HINT', context),
                                      style: robotoRegular.copyWith(
                                          color: Theme.of(context).hintColor)),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        // color: Color(0xffDAA50F),
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorResources.SignInColor1,
                                            ColorResources.SignInColor2
                                          ],
                                          end: Alignment.bottomCenter,
                                          begin: Alignment.topCenter,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL))),
                                    child: Icon(Icons.search,
                                        color: Theme.of(context).cardColor,
                                        size: Dimensions.ICON_SIZE_SMALL),
                                  ),
                                ]),
                          ),
                        ),
                      ))),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          Dimensions.HOME_PAGE_PADDING,
                          Dimensions.PADDING_SIZE_SMALL,
                          Dimensions.PADDING_SIZE_DEFAULT,
                          Dimensions.PADDING_SIZE_SMALL),
                      child: Column(
                        children: [
                          BannersView(),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                          // Category
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,
                                vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: TitleRow(
                                title: getTranslated('CATEGORY', context),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AllCategoryScreen()))),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimensions.HOME_PAGE_PADDING),
                            child: CategoryView(isHomePage: true),
                          ),

                          // Mega Deal
                          Consumer<FlashDealProvider>(
                            builder: (context, flashDeal, child) {
                              return (flashDeal.flashDeal != null &&
                                      flashDeal.flashDealList != null &&
                                      flashDeal.flashDealList.length > 0)
                                  ? TitleRow(
                                      title:
                                          getTranslated('flash_deal', context),
                                      eventDuration: flashDeal.flashDeal != null
                                          ? flashDeal.duration
                                          : null,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    FlashDealScreen()));
                                      },
                                      isFlash: true,
                                    )
                                  : SizedBox.shrink();
                            },
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Consumer<FlashDealProvider>(
                            builder: (context, megaDeal, child) {
                              return (megaDeal.flashDeal != null &&
                                      megaDeal.flashDealList != null &&
                                      megaDeal.flashDealList.length > 0)
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .77,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom:
                                                Dimensions.HOME_PAGE_PADDING),
                                        child: FlashDealsView(),
                                      ))
                                  : SizedBox.shrink();
                            },
                          ),

                          // Brand
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: TitleRow(
                                title: getTranslated('brand', context),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AllBrandScreen()));
                                }),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          BrandView(isHomePage: true),

                          //top seller
                          singleVendor
                              ? SizedBox()
                              : TitleRow(
                                  title: getTranslated('top_seller', context),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AllTopSellerScreen(
                                                  topSeller: null,
                                                )));
                                  },
                                ),
                          singleVendor
                              ? SizedBox(height: 0)
                              : SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          singleVendor
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: Dimensions.HOME_PAGE_PADDING),
                                  child: TopSellerView(isHomePage: true),
                                ),

                          //footer banner
                          Consumer<BannerProvider>(
                              builder: (context, footerBannerProvider, child) {
                            return footerBannerProvider.footerBannerList !=
                                        null &&
                                    footerBannerProvider
                                            .footerBannerList.length >
                                        0
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: Dimensions.HOME_PAGE_PADDING),
                                    child: FooterBannersView(
                                      index: 0,
                                    ),
                                  )
                                : SizedBox();
                          }),

                          // Featured Products
                          Consumer<ProductProvider>(
                              builder: (context, featured, _) {
                            return featured.featuredProductList != null &&
                                    featured.featuredProductList.length > 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                        vertical: Dimensions
                                            .PADDING_SIZE_EXTRA_SMALL),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom:
                                              Dimensions.PADDING_SIZE_SMALL),
                                      child: TitleRow(
                                          title: getTranslated(
                                              'featured_products', context),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => AllProductScreen(
                                                        productType: ProductType
                                                            .FEATURED_PRODUCT)));
                                          }),
                                    ),
                                  )
                                : SizedBox();
                          }),

                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimensions.HOME_PAGE_PADDING),
                            child: FeaturedProductView(
                              scrollController: _scrollController,
                              isHome: true,
                            ),
                          ),

                          // Featured Deal
                          Consumer<FeaturedDealProvider>(
                            builder: (context, featuredDealProvider, child) {
                              return featuredDealProvider
                                              .featuredDealProductList !=
                                          null &&
                                      featuredDealProvider
                                              .featuredDealProductList.length >
                                          0
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          bottom:
                                              Dimensions.PADDING_SIZE_SMALL),
                                      child: TitleRow(
                                          title: getTranslated(
                                              'featured_deals', context),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        FeaturedDealScreen()));
                                          }),
                                    )
                                  : SizedBox.shrink();
                            },
                          ),

                          Consumer<FeaturedDealProvider>(
                            builder: (context, featuredDealProvider, child) {
                              return featuredDealProvider
                                              .featuredDealProductList !=
                                          null &&
                                      featuredDealProvider
                                              .featuredDealProductList.length >
                                          0
                                  ? Container(
                                      height: featuredDealProvider
                                                  .featuredDealProductList
                                                  .length >
                                              4
                                          ? 120 * 4.0
                                          : 120 *
                                              (double.parse(featuredDealProvider
                                                  .featuredDealProductList
                                                  .length
                                                  .toString())),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom:
                                                Dimensions.HOME_PAGE_PADDING),
                                        child: FeaturedDealsView(),
                                      ))
                                  : SizedBox.shrink();
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimensions.HOME_PAGE_PADDING),
                            child: RecommendedProductView(),
                          ),

                          //footer banner
                          Consumer<BannerProvider>(
                              builder: (context, footerBannerProvider, child) {
                            return footerBannerProvider.mainSectionBannerList !=
                                        null &&
                                    footerBannerProvider
                                            .mainSectionBannerList.length >
                                        0
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: Dimensions.HOME_PAGE_PADDING),
                                    child: MainSectionBannersView(
                                      index: 0,
                                    ),
                                  )
                                : SizedBox();
                          }),

                          // Latest Products
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: TitleRow(
                                title:
                                    getTranslated('latest_products', context),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AllProductScreen(
                                              productType:
                                                  ProductType.LATEST_PRODUCT)));
                                }),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(
                              scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          //Home category
                          HomeCategoryProductView(isHomePage: true),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                          //footer banner
                          Consumer<BannerProvider>(
                              builder: (context, footerBannerProvider, child) {
                            return footerBannerProvider.footerBannerList !=
                                        null &&
                                    footerBannerProvider
                                            .footerBannerList.length >
                                        1
                                ? FooterBannersView(index: 1)
                                : SizedBox();
                          }),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                          //Category filter
                          Consumer<ProductProvider>(
                              builder: (ctx, prodProvider, child) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                  vertical:
                                      Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                        prodProvider.title == 'xyz'
                                            ? getTranslated(
                                                'new_arrival', context)
                                            : prodProvider.title,
                                        style: titleHeader)),
                                prodProvider.latestProductList != null
                                    ? PopupMenuButton(
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                                value: ProductType.NEW_ARRIVAL,
                                                child: Text(getTranslated(
                                                    'new_arrival', context)),
                                                textStyle:
                                                    robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                )),
                                            PopupMenuItem(
                                                value: ProductType.TOP_PRODUCT,
                                                child: Text(getTranslated(
                                                    'top_product', context)),
                                                textStyle:
                                                    robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                )),
                                            PopupMenuItem(
                                                value: ProductType.BEST_SELLING,
                                                child: Text(getTranslated(
                                                    'best_selling', context)),
                                                textStyle:
                                                    robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                )),
                                            PopupMenuItem(
                                                value: ProductType
                                                    .DISCOUNTED_PRODUCT,
                                                child: Text(getTranslated(
                                                    'discounted_product',
                                                    context)),
                                                textStyle:
                                                    robotoRegular.copyWith(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                )),
                                          ];
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.PADDING_SIZE_SMALL)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.PADDING_SIZE_SMALL,
                                              vertical: Dimensions
                                                  .PADDING_SIZE_SMALL),
                                          child: Image.asset(
                                            Images.dropdown,
                                            scale: 3,
                                          ),
                                        ),
                                        onSelected: (value) {
                                          if (value ==
                                              ProductType.NEW_ARRIVAL) {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .changeTypeOfProduct(
                                                    value, types[0]);
                                          } else if (value ==
                                              ProductType.TOP_PRODUCT) {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .changeTypeOfProduct(
                                                    value, types[1]);
                                          } else if (value ==
                                              ProductType.BEST_SELLING) {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .changeTypeOfProduct(
                                                    value, types[2]);
                                          } else if (value ==
                                              ProductType.DISCOUNTED_PRODUCT) {
                                            Provider.of<ProductProvider>(
                                                    context,
                                                    listen: false)
                                                .changeTypeOfProduct(
                                                    value, types[3]);
                                          }

                                          ProductView(
                                              isHomePage: false,
                                              productType: value,
                                              scrollController:
                                                  _scrollController);
                                          Provider.of<ProductProvider>(context,
                                                  listen: false)
                                              .getLatestProductList(1, context,
                                                  reload: true);
                                        })
                                    : SizedBox(),
                              ]),
                            );
                          }),
                          ProductView(
                              isHomePage: false,
                              productType: ProductType.NEW_ARRIVAL,
                              scrollController: _scrollController),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Provider.of<SplashProvider>(context, listen: false)
                          .configModel
                          .announcement
                          .status ==
                      '1'
                  ? Positioned(
                      top: MediaQuery.of(context).size.height - 128,
                      left: 0,
                      right: 0,
                      child: Consumer<SplashProvider>(
                        builder: (context, announcement, _) {
                          return (announcement.configModel.announcement
                                          .announcement !=
                                      null &&
                                  announcement.onOff)
                              ? AnnouncementScreen(
                                  announcement:
                                      announcement.configModel.announcement)
                              : SizedBox();
                        },
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButommDrawer extends StatelessWidget {
  const ButommDrawer({
    Key key,
    this.text,
    this.image,
    this.onTap,
  }) : super(key: key);
  final String text, image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 37, top: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image == 'assets/images/Vector.png'
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                      top: 9,
                      bottom: 9,
                    ),
                    child: Image.asset(
                      image,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                  )
                : Image.asset(
                    image,
                    width: 48,
                    height: 48,
                    fit: BoxFit.fill,
                  ),
            image == 'assets/images/Vector.png'
                ? SizedBox(
                    width: 18,
                  )
                : SizedBox(
                    width: 14,
                  ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
