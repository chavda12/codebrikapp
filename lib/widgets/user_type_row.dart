import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTypeRow extends StatelessWidget {
  const UserTypeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            title: 'User Type',
            style: ourStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
          width: 150,
          child: DropdownMenu(
            inputDecorationTheme:
                InputDecorationTheme(border: InputBorder.none),
            initialSelection: userState.userModel.userInfo?.UserType ?? 'M',
            onSelected: (value) {
              updateUserDetails(UserDetailsKeys.userType, value ?? 'M');
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 'M', label: "Master"),
              DropdownMenuEntry(value: 'S', label: "Single")
            ],
            textStyle: ourStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
