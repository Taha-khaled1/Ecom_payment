import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:provider/provider.dart';

import '../provider/notification_provider.dart';

class NotifiactionScreen1 extends StatefulWidget {
  const NotifiactionScreen1({Key key}) : super(key: key);

  @override
  State<NotifiactionScreen1> createState() => _NotifiactionScreen1State();
}

class _NotifiactionScreen1State extends State<NotifiactionScreen1> {
  @override
  Widget build(BuildContext context) {
        Provider.of<NotificationProvider>(context, listen: false).initNotificationList(context);
    return Scaffold(
      backgroundColor:Color(0xffF5F5F5),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back,size: 20,),
                    Spacer(),
                Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Spacer()
                
                  ],
                ),
                NotificationsContainerWidget(),
                Divider(),
                NotificationsContainerWidget(),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
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
                  child: Center(child: Text('View all',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
            ),),
                  ),

                  SizedBox(height: 10,),
                  

                
               
                
              ],
            ),
          ),
        ),
      )
    );
  }
}

class NotificationsContainerWidget extends StatelessWidget {
  const NotificationsContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(children: [
          Container(height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: AssetImage(Images.onboarding_screen3),fit: BoxFit.cover)
          ),),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New kids collection',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Text('Girls category',style: TextStyle(fontSize: 16),),
                Spacer(),
                Text('1 day ago',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Color(0xff888888)),)
                

              ],
            ),
          ),
          
        ],),
      ),
    );
  }
}