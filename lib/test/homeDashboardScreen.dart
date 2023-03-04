import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import '../utill/custom_themes.dart';
import '../utill/images.dart';

class HomeDashboardScreen extends StatefulWidget {
  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          CategoriesBottomContainer(
                            clr: Colors.transparent,
                            txt: 'KIDS',
                            font: FontWeight.w400,
                          ),
                          CategoriesBottomContainer(
                            clr: Colors.yellow[800],
                            txt: 'WOMEN',
                            font: FontWeight.bold,
                          ),
                          CategoriesBottomContainer(
                            clr: Colors.transparent,
                            txt: 'MEN',
                            font: FontWeight.w400,
                          ),
                          CategoriesBottomContainer(
                            clr: Colors.transparent,
                            txt: 'COLLECTIONS',
                            font: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        'MORE+',
                        style: TextStyle(color: Color(0xff3B97D3)),
                      ),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              Container(
                height: 440,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WomenCategoryWidget(
                            img: '${Images.grlblack}',
                            productName: 'Dress Black',
                            productType: 'Shirts',
                            oldPrice: '450\$',
                            newPrice: '499.99\$',
                          ),
                          WomenCategoryWidget(
                            img: '${Images.grlblack}',
                            productName: 'Dress Black',
                            productType: 'Shirts',
                            oldPrice: '450\$',
                            newPrice: '499.99\$',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WomenCategoryWidget(
                            img: '${Images.grlblack}',
                            productName: 'Dress Black',
                            productType: 'Shirts',
                            oldPrice: '450\$',
                            newPrice: '499.99\$',
                          ),
                          WomenCategoryWidget(
                            img: '${Images.grlblack}',
                            productName: 'Dress Black',
                            productType: 'Shirts',
                            oldPrice: '450\$',
                            newPrice: '499.99\$',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WomenCategoryWidget extends StatelessWidget {
  String img;
  String productName;
  String productType;
  String oldPrice;
  String newPrice;

  WomenCategoryWidget({
    @required this.img,
    @required this.productName,
    @required this.productType,
    @required this.oldPrice,
    @required this.newPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 190,
          width: 141,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffffffff)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    '$productName\n$productType',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$oldPrice',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF0000),
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '$newPrice',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff65AFF6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
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
              '10 % off',
              style: titilliumRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  color: Theme.of(context).cardColor),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoriesBottomContainer extends StatelessWidget {
  Color clr;
  String txt;
  FontWeight font;

  CategoriesBottomContainer(
      {@required this.clr, @required this.txt, @required this.font});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: clr,
          ),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(fontSize: 13, fontWeight: font),
        ),
      ),
    );
  }
}
