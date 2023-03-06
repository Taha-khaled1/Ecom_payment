import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../localization/language_constrants.dart';
import '../utill/dimensions.dart';
import '../utill/images.dart';
import '../view/basewidget/textfield/custom_textfield.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController _priceController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 328,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.grlblackscaf),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(32)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerButton(
                            ic: Icon(
                          CupertinoIcons.back,
                          color: Color(0xffDAA000),
                        )),
                        ContainerButton(
                            ic: Icon(
                          CupertinoIcons.heart,
                          color: Color(0xffDAA000),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ContainerButton(
                            ic: Icon(
                          CupertinoIcons.share,
                          color: Color(0xffDAA000),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'White Dress',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$550',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF0000),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star, color: Color(0xffF1BD23)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.9',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('(121)'),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Color(0xff6E80B0),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Women',
                        style: TextStyle(color: Color(0xff6E80B0)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Color(0xff6E80B0),
                      ),
                      Spacer(),
                      Text('\$488',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff65AFF6),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 66,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(Images.adidas),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adidas store',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Fatemah Subrana',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff555555)),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(CupertinoIcons.arrow_up_right_square),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                      text:
                          'Dress - 1058/452\nSleeveless cropped top with a round neck and shoulder pads, featuring an elasticated hem and a buttoned opening at the back...',
                      style: TextStyle(fontSize: 13),
                      children: [
                        TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffDAA000)),
                        )
                      ])),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Size',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizeContainer(
                        size: 'S',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizeContainer(
                        size: 'M',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizeContainer(
                        size: 'L',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Color',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      ColorContainer(
                        clrimg: '${Images.colorsample1}',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ColorContainer(
                        clrimg: '${Images.colorsample2}',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ColorContainer(
                        clrimg: '${Images.colorsample3}',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('7 Days Return Policy'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Safe Payment'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('100% Authentic Products'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Similar Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SimilarProductsContainer(
                    img: '${Images.grlblack}',
                    productName: 'Black Dress',
                    shopName: 'Deluxe Online',
                    price: '\$450',
                  ),
                  SimilarProductsContainer(
                    img: '${Images.grlblackscaf}',
                    productName: 'Black Dress',
                    shopName: 'Deluxe Online',
                    price: '\$450',
                  ),
                  SimilarProductsContainer(
                    img: '${Images.grlblack}',
                    productName: 'Black Dress',
                    shopName: 'Deluxe Online',
                    price: '\$450',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          width: 159,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xffDAA000),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xffDAA000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _settingModalBottomSheet(context);
                          },
                          child: Container(
                            width: 159,
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
                                'Buy Now',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class SimilarProductsContainer extends StatelessWidget {
  String img;
  String productName;
  String shopName;
  String price;
  SimilarProductsContainer(
      {@required this.img,
      @required this.productName,
      @required this.shopName,
      @required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    shopName,
                    style: TextStyle(fontSize: 11, color: Color(0xff6E80B0)),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDAA000)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF8F8FA),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.add,
                        color: Color(0xffDAA000),
                      )
                    ],
                  ),
                ),
                Text(
                  'Customizable',
                  style: TextStyle(fontSize: 9, color: Color(0xff6E80B0)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SizeContainer extends StatelessWidget {
  String size;
  SizeContainer({@required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(),
      ),
      child: Center(child: Text(size)),
    );
  }
}

class ColorContainer extends StatelessWidget {
  String clrimg;
  ColorContainer({@required this.clrimg});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 95,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Center(child: Image.asset(clrimg)),
    );
  }
}

class ContainerButton extends StatelessWidget {
  Icon ic;
  ContainerButton({
    @required this.ic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          color: Color(0xffF1F1F1), borderRadius: BorderRadius.circular(8)),
      child: Center(child: ic),
    );
  }
}

void _settingModalBottomSheet(context) {
  TextEditingController _priceController;
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 173,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.grlblackscaf),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Black Dress',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Size:',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            Text(' L (Change)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Color:',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            Text(' White (Change)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Price:',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            Text(' 449.99\$',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              height: 40,
                              color: Color(0xffDFDFDF),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              ),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              'Remove',
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 159,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xffDAA000),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xffDAA000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                        width: 159,
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
                            'Buy Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
