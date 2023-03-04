import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  final String title;
  FAQScreen({@required this.title});


  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
                        'FAQ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Frequently asked questions',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                       SizedBox(
                    height: 20,
                  ),
                      Text('Join our community now to get free updates and also alot of freebies are waiting for you or Contact Support',style: TextStyle(
                             fontSize: 16),
                      ),
                       SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(title: Text('General',style: TextStyle(
                             fontSize: 16)),
                  children: [
                    Text('Details of genreal would be displayed here')
                  ],),
                  ExpansionTile(title: Text('How does it work',style: TextStyle(
                             fontSize: 16)),
                  children: [
                    Text('Details of How does it work would be displayed here')
                  ],),
                  ExpansionTile(title: Text('How to start',style: TextStyle(
                             fontSize: 16)),
                  children: [
                    Text('Details of How to start would be displayed here')
                  ],),
                  ExpansionTile(title: Text('How to payment',style: TextStyle(
                             fontSize: 16)),
                  children: [
                    Text('Details of How to payment would be displayed here')
                  ],),
                  ExpansionTile(title: Text('Why my order get canceled',style: TextStyle(
                             fontSize: 16)),
                  children: [
                    Text('Details of Why my order get canceled would be displayed here')
                  ],),
                   SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:12,vertical: 40),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.black,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Instagram\n\nTwitter\n\nDiscord\n\nBlog',style: TextStyle(
                             fontSize: 15,color: Colors.white)),
                             
            Text('About\nCommunity Guidelines\nTerms of Service\nPrivacy\nCareers\nHelp',style: TextStyle(
                             fontSize: 16,color: Colors.white)),
          ],),
          SizedBox(height: 10,),

          Divider(color: Colors.white,),
          SizedBox(height: 10,),

          Text('© 2022 Ayoub . CuliaArt Studio',style: TextStyle(
                             fontSize: 16,color: Colors.white)),

        ],
      ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
