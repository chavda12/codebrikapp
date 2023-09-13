import 'package:codebrikapp/bloc/index_bloc.dart' hide userState;
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/widgets/check_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradeLimitInfo extends StatelessWidget {
  const TradeLimitInfo({
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
          CustomText(title: 'High Low Between Trade Limit'),
          CheckBoxes(
              dataList: userState.userModel.hLTradeExchangeInfo
                  .map((info) => {
                        "id": info.ExchangeID.toString(),
                        "name": info.ExchangeName,
                      })
                  .toList(),
              selectedDataList: userState
                      .dataToUpdate[UserDetailsKeys.dtHighLowTradingBo.name] ??
                  [],
              onChange: (isSelected, data) {
                userBloc
                    .add(UpdateHLTradingData(data: data, isAdd: !isSelected));
              })
        ],
      ),
    );
  }
}
