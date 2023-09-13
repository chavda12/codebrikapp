import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/custom/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfitLossSharing extends StatelessWidget {
  const ProfitLossSharing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title: 'partnership share Detail'),
          SizedBox(
            height: 10,
          ),
          CustomTextField(title: 'Profitt & Loss sharing*', needSpace: false),
          CustomText(
              title:
                  'Our ${userState.userModel.userInfo?.PLOur} | Remaining:${userState.userModel.userInfo?.PLDownline}'),
          SizedBox(
            height: 15,
          ),
          CustomTextField(title: 'Brk Sharing*', needSpace: false),
          CustomText(
              title:
                  'Our ${userState.userModel.userInfo?.BSOur} | Remaining:${userState.userModel.userInfo?.BSDownline}'),
        ],
      ),
    );
  }
}
