import 'package:codebrikapp/utils/styles.dart';
import 'package:flutter/material.dart';

Text CustomText({String? title = '',TextStyle? style}) {
  return Text(
    title ?? '',
    style:style?? ourStyle(),
  );
}
