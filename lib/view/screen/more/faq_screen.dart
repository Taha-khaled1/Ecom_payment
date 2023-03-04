import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatefulWidget {
  final String title;
  FaqScreen({@required this.title});

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          CustomAppBar(title: widget.title),
              Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Frequently asked questions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          'Join our community now to get free updates and also alot of freebies are waiting for you or Contact Support',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
          Provider.of<SplashProvider>(context).configModel.faq != null &&
                  Provider.of<SplashProvider>(context).configModel.faq.length >
                      0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: Provider.of<SplashProvider>(context)
                          .configModel
                          .faq
                          .length,
                      itemBuilder: (ctx, index) {
                        return Consumer<SplashProvider>(
                          builder: (ctx, faq, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                        child: ExpansionTile(
                                      iconColor: Theme.of(context).primaryColor,
                                      title: Text(
                                          faq.configModel.faq[index].question,
                                          style: robotoBold.copyWith(
                                              color:
                                                  ColorResources.getTextTitle(
                                                      context))),
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            faq.configModel.faq[index].answer,
                                            style: robotoRegular,
                                            textAlign: TextAlign.justify,
                                          ),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      }),
                )
              : NoInternetOrDataScreen(isNoInternet: false),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
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
                Text('Instagram\n\nTwitter\n\nDiscord\n\nBlog',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Text(
                    'About\nCommunity Guidelines\nTerms of Service\nPrivacy\nCareers\nHelp',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text('© 2022 Ayoub . CuliaArt Studio',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
