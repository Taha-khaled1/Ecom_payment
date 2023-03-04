import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter/cupertino.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({Key key}) : super(key: key);

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
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
                    'Card Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CardDetailContainer(
                methodIcon: Icon(CupertinoIcons.add),
                methodName: 'Order Summary',
              ),
              CardDetailContainer(
                methodIcon: Icon(Icons.remove),
                methodName: 'Payment Details',
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 342,
                decoration: BoxDecoration(
                    color: Color(0xffFDFDFD),
                    border: Border.all(
                      color: Color(0xffEBEBEB),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Amount',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            '\$ 1590.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '(Change)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Debit Card',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Card Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color:Color(0xffEBEBEB), )
                        ),
                        
                        child: TextField(

                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], 
                        ),
                      ),
                     

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                        'Expiry Date',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        'Card CVV',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                                                  width: 133,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                            border: Border.all(color:Color(0xffEBEBEB), )
                                                  ),
                                                  
                                                  child: TextField(
                          
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], 
                                                  ),
                                                ),
                          ),
                          SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          width: 133,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color:Color(0xffEBEBEB), )
                          ),
                          
                          child: TextField(
                      
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], 
                          ),
                        ),
                      ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Color(0xffDAA000),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Confirm Payment',
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

class CardDetailContainer extends StatefulWidget {
  String methodName;
  Icon methodIcon;
  CardDetailContainer({
    @required this.methodIcon,
    @required this.methodName,
  });

  @override
  State<CardDetailContainer> createState() => _CardDetailContainerState();
}

class _CardDetailContainerState extends State<CardDetailContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 54,
      decoration: BoxDecoration(
          color: Color(0xffFDFDFD),
          border: Border.all(
            color: Color(0xffEBEBEB),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.methodName,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          widget.methodIcon,
        ],
      ),
    );
  }
}
