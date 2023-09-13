import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_state.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterCheckBox extends StatelessWidget {
  const MasterCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greyColor.withOpacity(0.3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title: 'Add Master'),
                  Checkbox(
                    activeColor: blackColor,
                    value: (state.dataToUpdate[UserDetailsKeys.canAdd.name] ??
                            'false') ==
                        'true',
                    onChanged: (bool? value) {
                      updateUserDetails(
                          UserDetailsKeys.canAdd, (value ?? false).toString());
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title: 'Change password on first login'),
                  Checkbox(
                    activeColor: blackColor,
                    value: (state.dataToUpdate[
                                UserDetailsKeys.passChangeonLogin.name] ??
                            'false') ==
                        'true',
                    onChanged: (bool? value) {
                      updateUserDetails(UserDetailsKeys.passChangeonLogin,
                          (value ?? false).toString());
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
