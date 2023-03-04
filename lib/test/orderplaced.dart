import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter/cupertino.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({Key key}) : super(key: key);

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
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
                    'Thank You',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Spacer(),
              Center(child: Icon(Icons.check_circle,color: Colors.green,size: 56,)),
              SizedBox(height: 30,),
              Center(
                  child: Text(
                    'Order Placed!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    'We\'ll keep you updated the \n       status of your order.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,),
                  ),
                ),
                Spacer(),

                Center(
                  child: Text(
                    'Your Order Id',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                    'ODZ154623688',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,),
                  ),
                ),
              
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color:Color(0xffDAA000), ),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Track Your Order',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xffDAA000),),
                  ),
                ),
              ),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Color(0xffDAA000),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
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
