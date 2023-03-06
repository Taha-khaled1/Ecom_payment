import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product productModel;
  ProductWidget({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    String ratting =
        productModel.rating != null && productModel.rating.length != 0
            ? productModel.rating[0].average
            : "0";

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) =>
                  ProductDetails(product: productModel),
            ));
      },
      child: Container(
        height: 330,
        margin: EdgeInsets.all(11),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(6, 6),
              color: Colors.grey[400],
            ),
            BoxShadow(
              blurRadius: 10,
              offset: Offset(-6, -6),
              color: Colors.grey[300],
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 270,
              height: 220,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Colors.grey[300],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productModel.name ?? '',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),

                  Column(
                    children: [
                      productModel.discount != null && productModel.discount > 0
                          ? Text(
                              PriceConverter.convertPrice(
                                  context, productModel.unitPrice),
                              style: titleRegular.copyWith(
                                color: ColorResources.getRed(context),
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18,
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        PriceConverter.convertPrice(
                            context, productModel.unitPrice,
                            discountType: productModel.discountType,
                            discount: productModel.discount),
                        style: titilliumSemiBold.copyWith(
                          color: Color(0xff65AFF6),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )

                  // Text(
                  //   '300',
                  //   style: TextStyle(color: Colors.red, fontSize: 17),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//         height: MediaQuery.of(context).size.width/1.5,
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Theme.of(context).highlightColor,
//           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
//         ),
//         child: Stack(children: [
//           Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//             // Product Image
//             Container(
//               height: MediaQuery.of(context).size.width/2.45,
//               decoration: BoxDecoration(
//                 color: ColorResources.getIconBg(context),
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//                 child: FadeInImage.assetNetwork(
//                   placeholder: Images.placeholder, fit: BoxFit.cover,
//                   height: MediaQuery.of(context).size.width/2.45,
//                   image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
//                   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
//                       fit: BoxFit.cover,height: MediaQuery.of(context).size.width/2.45),
//                 ),
//               ),
//             ),

//             // Product Details
//             Padding(
//               padding: EdgeInsets.only(top :Dimensions.PADDING_SIZE_SMALL,bottom: 5, left: 5,right: 5),
//               child: Container(

//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(productModel.name ?? '', textAlign: TextAlign.center,
//                           style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
//                           fontWeight: FontWeight.w400), maxLines: 2,
//                           overflow: TextOverflow.ellipsis),
//                       SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

//                       Row(mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             RatingBar(
//                               rating: double.parse(ratting),
//                               size: 18,
//                             ),

//                         Text('(${productModel.reviewCount.toString() ?? 0})',
//                             style: robotoRegular.copyWith(
//                               fontSize: Dimensions.FONT_SIZE_SMALL,
//                             )),

//                       ]),
//                       SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      //   productModel.discount!= null && productModel.discount > 0 ?
                      //   Text(PriceConverter.convertPrice(context, productModel.unitPrice),
                      //   style: titleRegular.copyWith(
                      //     color: ColorResources.getRed(context),
                      //     decoration: TextDecoration.lineThrough,

                      //     fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                      //   ),
                      // ) : SizedBox.shrink(),
                      // SizedBox(height: 2,),

                      // Text(PriceConverter.convertPrice(context,
                      //     productModel.unitPrice, discountType: productModel.discountType,
                      //     discount: productModel.discount),
                      //   style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                      // ),

//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ]),

//           // Off

//           productModel.discount > 0 ?
//           Positioned(top: 0, left: 0, child: Container(
//               height: 20,
//               padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
//               decoration: BoxDecoration(
//                 color: ColorResources.getPrimary(context),
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
//               ),

//               child: Center(
//                 child: Text(PriceConverter.percentageCalculation(context, productModel.unitPrice,
//                       productModel.discount, productModel.discountType),
//                   style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
//                       fontSize: Dimensions.FONT_SIZE_SMALL),
//                 ),
//               ),
//             ),
//           ) : SizedBox.shrink(),

//         ]),
//       ),
