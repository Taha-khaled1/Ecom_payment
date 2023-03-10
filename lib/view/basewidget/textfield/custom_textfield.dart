import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;

  CustomTextField({
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = false,
  });

  @override
  Widget build(context) {
    return TextFormField(
      textAlign: isBorder ? TextAlign.center : TextAlign.start,
      controller: controller,
      maxLines: maxLine ?? 1,
      textCapitalization: capitalization,
      maxLength: isPhoneNumber ? 15 : null,
      focusNode: focusNode,
      keyboardType: textInputType ?? TextInputType.text,
      //keyboardType: TextInputType.number,
      initialValue: null,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextNode);
      },
      //autovalidate: true,
      inputFormatters: [
        isPhoneNumber
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      validator: (input) {
        if (input.isEmpty) {
          if (isValidator) {
            return validatorMessage ?? "";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText ?? '',

        filled: fillColor != null,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
        isDense: true,
        counterText: '',
        //  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffDAA50F))),
        hintStyle: titilliumRegular.copyWith(color: Colors.black),
        errorStyle: TextStyle(height: 1.5),
        border: InputBorder.none,
      ),
    );
  }
}
