import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/custom/custom_textfields.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title: 'Personal Details'),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            title: 'Name*',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.displayName, value),
          ),
          CustomTextField(
            title: 'Username*',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.userName, value),
          ),
          CustomTextField(
            title: 'Password*',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.userPassword, value),
          ),
          CustomTextField(
            title: 'Retypr Password*',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.retypePassword, value),
          ),
          CustomTextField(
            title: 'Mobile Number',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.mobile, value),
          ),
          CustomTextField(
            title: 'City',
            onChange: (value) => updateUserDetails(UserDetailsKeys.city, value),
          ),
          CustomTextField(
            title: 'Credit*',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.cashMargin, value),
          ),
          CustomTextField(
            title: 'Remark',
            onChange: (value) =>
                updateUserDetails(UserDetailsKeys.reference, value),
          ),
        ],
      ),
    );
  }
}
