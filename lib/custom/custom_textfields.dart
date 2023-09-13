import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool needSpace;
  final Function(String value)? onChange;

  CustomTextField({
    this.title = '',
    this.subTitle = '',
    this.needSpace = true,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 3, color: greyColor.withOpacity(0.5)));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: title),
        TextFormField(
          cursorColor: blackColor,
          onChanged: onChange,
          decoration: InputDecoration(
            enabledBorder: inputBorder,
            focusColor: greyColor,
            focusedBorder: inputBorder,
          ),
        ),
        if (needSpace)
          SizedBox(
            height: 10,
          )
      ],
    );
  }
}
