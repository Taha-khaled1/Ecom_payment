import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';

class LoginRequestScreen extends StatefulWidget {
  const LoginRequestScreen({Key key}) : super(key: key);

  @override
  State<LoginRequestScreen> createState() => _LoginRequestScreenState();
}

class _LoginRequestScreenState extends State<LoginRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.mobile_login),
            Text(
              'Please login first to continue',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Because you are now in quest mode',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
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
                  child: Center(child: Text('Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
            ),),
            ),
            SizedBox(height: 20,),
            Text(
              'create new account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xff3B97D3)),
            ),
          ],
        ),
      )),
    );
  }
}
