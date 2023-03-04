import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/helper/date_converter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/notification_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/notification/widget/notification_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  final bool isBacButtonExist;
  NotificationScreen({this.isBacButtonExist = true});

  @override
  Widget build(BuildContext context) {
    Provider.of<NotificationProvider>(context, listen: false)
        .initNotificationList(context);

    return Scaffold(
      body: Column(children: [
        CustomAppBar(
            title: getTranslated('notification', context),
            isBackButtonExist: isBacButtonExist),
        Expanded(
          child: Consumer<NotificationProvider>(
            builder: (context, notification, child) {
              return notification.notificationList != null
                  ? notification.notificationList.length != 0
                      ? RefreshIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                          onRefresh: () async {
                            await Provider.of<NotificationProvider>(context,
                                    listen: false)
                                .initNotificationList(context);
                          },
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 10,
                                color: Colors.grey,
                              );
                            },
                            itemCount:
                                Provider.of<NotificationProvider>(context)
                                    .notificationList
                                    .length,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.PADDING_SIZE_SMALL),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 70,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: Images.placeholder,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                            image:
                                                '${Provider.of<SplashProvider>(context, listen: false).baseUrls.notificationImageUrl}/${notification.notificationList[index].image}',
                                            imageErrorBuilder: (c, o, s) =>
                                                Image.asset(Images.placeholder,
                                                    height: 50,
                                                    width: 50,
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              notification
                                                  .notificationList[index]
                                                  .title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              'Girls category', // TODO : Category Name
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Spacer(),
                                            Text(
                                              DateConverter
                                                  .localDateToIsoStringAMPM(
                                                      DateTime.parse(
                                                          notification
                                                              .notificationList[
                                                                  index]
                                                              .createdAt)),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color(0xff888888)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              // InkWell(
                              //   onTap: () => showDialog(context: context, builder: (context) => NotificationDialog(notificationModel: notification.notificationList[index])),
                              //   child: Container(
                              //     margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                              //     color: ColorResources.getGrey(context),
                              //     child: ListTile(
                              //       leading: ClipOval(child: FadeInImage.assetNetwork(
                              //         placeholder: Images.placeholder, height: 50, width: 50, fit: BoxFit.cover,
                              //         image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.notificationImageUrl}/${notification.notificationList[index].image}',
                              //         imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, height: 50, width: 50, fit: BoxFit.cover),
                              //       )),
                              //       title: Text(notification.notificationList[index].title, style: titilliumRegular.copyWith(
                              //         fontSize: Dimensions.FONT_SIZE_SMALL,
                              //       )),
                              //       subtitle: Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(notification.notificationList[index].createdAt)),
                              //         style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getHint(context)),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        )
                      : NoInternetOrDataScreen(isNoInternet: false)
                  : NotificationShimmer();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                  child: Center(
                    child: Text(
                      'View all',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xffDAA50F)),
                  ),
                  child: Center(
                    child: Text(
                      'Mark as all read',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xffDAA50F)),
                    ),
                  ),
                ),
              ]),
        ),
  
      ]),
    );
  }
}

class NotificationShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
          color: ColorResources.getGrey(context),
          alignment: Alignment.center,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled:
                Provider.of<NotificationProvider>(context).notificationList ==
                    null,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.notifications)),
              title: Container(height: 20, color: ColorResources.WHITE),
              subtitle:
                  Container(height: 10, width: 50, color: ColorResources.WHITE),
            ),
          ),
        );
      },
    );
  }
}
