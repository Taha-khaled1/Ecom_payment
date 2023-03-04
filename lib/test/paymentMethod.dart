import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter/cupertino.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                    'Payment Method',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              PaymentMethodContainer(
                methodIcon: Icon(CupertinoIcons.creditcard),
                methodName: 'Debit Card',
              ),
              PaymentMethodContainer(
                methodIcon: Icon(CupertinoIcons.creditcard),
                methodName: 'Credit Card',
              ),
              PaymentMethodContainer(
                methodIcon: Icon(CupertinoIcons.creditcard),
                methodName: 'Paypal',
              ),
              Spacer(),
              Container(
                height: 48,
                decoration: BoxDecoration(color: Color(0xffDAA000)
                ,
                borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child:Text('Proceed Payment',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodContainer extends StatefulWidget {
  String methodName;
  Icon methodIcon;
  PaymentMethodContainer({
    @required this.methodIcon,
    @required this.methodName,
  });

  @override
  State<PaymentMethodContainer> createState() => _PaymentMethodContainerState();
}

class _PaymentMethodContainerState extends State<PaymentMethodContainer> {
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
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.methodIcon,
          SizedBox(
            width: 10,
          ),
          Text(
            widget.methodName,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: isChecked,
            onChanged: (bool value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
