import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final bool isBuy;
  final bool isBorder;
  final Color textColor;
  CustomButton(
      {this.onTap,
      @required this.buttonText,
      this.isBuy = false,
      this.isBorder = false,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1)), // changes position of shadow
            ],
            border: isBorder
                ? Border.all(color: Color(0xffFE961C), width: 1)
                : Border.all(width: 0, color: Colors.transparent),
            gradient:
                (Provider.of<ThemeProvider>(context).darkTheme || onTap == null)
                    ? null
                    : isBuy
                        ? LinearGradient(colors: [
                            Color(0xffFE961C),
                            Color(0xffFE961C),
                            Color(0xffFE961C),
                          ])
                        : LinearGradient(
                            colors: [Colors.white, Colors.white],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
            borderRadius: BorderRadius.circular(isBorder
                ? Dimensions.PADDING_SIZE_EXTRA_SMALL
                : Dimensions.PADDING_SIZE_SMALL)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: textColor ?? Theme.of(context).highlightColor,
            )),
      ),
    );
  }
}
