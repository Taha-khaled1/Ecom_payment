import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter/cupertino.dart';

import '../view/screen/home/widget/banners_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    Spacer(),
                    Text(
                      'Category',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BannersView(),
                SizedBox(
                  height: 20,
                ),
                CategoriesContainer(clr:Colors.grey.shade200 ,txt: 'Jewelry & Watches',img: '${Images.watch}',onTap: (){},),
                CategoriesContainer(clr:Colors.red.shade200 ,txt: 'Collection',img: '${Images.nails}',onTap: (){},),
                CategoriesContainer(clr:Colors.green.shade200 ,txt: 'Shoes & Bags',img: '${Images.shoes}',onTap: (){},),
                CategoriesContainer(clr:Colors.blue.shade200 ,txt: 'Jewelry & Watches',img: '${Images.watch}',onTap: (){},),
                 CategoriesContainer(clr:Colors.grey.shade200 ,txt: 'Jewelry & Watches',img: '${Images.watch}',onTap: (){},),
                CategoriesContainer(clr:Colors.red.shade200 ,txt: 'Collection',img: '${Images.nails}',onTap: (){},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesContainer extends StatelessWidget {
   String txt;
   String img;
   Color clr;
   VoidCallback onTap;
   CategoriesContainer({
  @required this.img,
  @required this.txt,
  @required this.clr,
  @required this.onTap,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 118,
      decoration: BoxDecoration(
         color: clr,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Center(child: Text(txt,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),

          ),),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                
                image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12)
              ),

          ),),
        ],
      ),
    );
  }
}
