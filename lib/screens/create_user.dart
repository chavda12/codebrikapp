import 'package:codebrikapp/bloc/app_bloc/app_event.dart';
import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/utils/functions.dart';
import 'package:codebrikapp/utils/styles.dart';
import 'package:codebrikapp/widgets/exchange_details.dart';
import 'package:codebrikapp/widgets/master_checkbox.dart';
import 'package:codebrikapp/widgets/personal_details.dart';
import 'package:codebrikapp/widgets/profit_loss_sharing.dart';
import 'package:codebrikapp/widgets/trade_limit_info.dart';
import 'package:codebrikapp/widgets/user_type_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  List<Map<String, String>> selectExchangeListIndex = [];
  List<Map<String, String>> selectTradeListIndex = [];

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void initState() {
    appBloc.add(GenerateToken());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        title: Text(
          'Create New user',
          style: ourStyle(fontSize: 18),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTypeRow(),
              SizedBox(
                height: 10,
              ),
              PersonalDetails(),
              SizedBox(height: 15),
              ProfitLossSharing(),
              SizedBox(height: 15),
              ExchangeDetails(),
              SizedBox(height: 15),
              TradeLimitInfo(),
              SizedBox(
                height: 15,
              ),
              MasterCheckBox(),
              SizedBox(
                height: 15,
              ),
              button()
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blueColor,
      ),
      child: TextButton(
        onPressed: () {
          userBloc.add(SubmitUserData());
        },
        child: CustomText(
          title: 'CREATE',
          style: ourStyle(color: whiteColor),
        ),
      ),
    );
  }
}
