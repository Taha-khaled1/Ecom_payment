import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'My Cart',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 325,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      MyCartProductsContainer(
                          img: '${Images.grlblack}',
                          productName: 'Black Dress',
                          shopName: 'Deluxe',
                          price: '488\$',
                          onTap: () {}),
                      MyCartProductsContainer(
                          img: '${Images.onboarding_screen1}',
                          productName: 'Hijab',
                          shopName: 'Gucci',
                          price: '428\$',
                          onTap: () {}),
                      MyCartProductsContainer(
                          img: '${Images.grlblack}',
                          productName: 'Black Dress',
                          shopName: 'Deluxe',
                          price: '488\$',
                          onTap: () {}),
                      MyCartProductsContainer(
                          img: '${Images.grlblackscaf}',
                          productName: 'Black Dress',
                          shopName: 'Deluxe',
                          price: '488\$',
                          onTap: () {}),
                    ],
                  ),
                ),
              ),
              Divider(),
              Text(
                'Promo Code',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Promo Code Applied',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
                  ),
                  Spacer(),
                  Container(
                    width: 92,
                    height: 45,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'NEW50',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Promo Code Discount',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey),),
                            Text('\$ 149.00',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery Charges',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey),),
                            Text('\Free',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey),),
                            Text('\$ 1441.00',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(color: Color(0xffDAA000)
                          ,
                          borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child:Text('Checkout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCartProductsContainer extends StatelessWidget {
  String img;
  String productName;
  String shopName;
  String price;
  VoidCallback onTap;
  MyCartProductsContainer(
      {@required this.img,
      @required this.productName,
      @required this.shopName,
      @required this.price,
      @required this.onTap});

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
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ' Remove',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.red),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
