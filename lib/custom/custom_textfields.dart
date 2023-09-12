import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:codebrikapp/utils/styles.dart';

CustomTextFields(
    {String? title = '',
    String? subTitle = '',
    bool needSpace = true,
    required TextEditingController controller}) {
  InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 3, color: greyColor.withOpacity(0.5)));
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(title: title),
      Container(
        height: 40,
        child: TextField(
          controller: controller,
          cursorColor: blackColor,
          decoration: InputDecoration(
            enabledBorder: inputBorder,

            focusColor: greyColor,
            focusedBorder: inputBorder,
            // labelText: title,
            // labelStyle: ourStyle(color: greyColor),
            // hintText: subTitle,
            // hintStyle: ourStyle(color: greyColor)),
          ),
        ),
      ),
     if(needSpace) SizedBox(
        height: 10,
      )
    ],
  );
}
