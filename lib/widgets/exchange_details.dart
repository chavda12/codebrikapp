import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/bloc/user_bloc/user_state.dart';
import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/widgets/check_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeDetails extends StatelessWidget {
  const ExchangeDetails({
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
          child: CheckBoxes(
            dataList: state.userModel.activeExchangeInfo
                .map((info) => {
                      "id": info.ExchangeId.toString(),
                      "name": info.ExchangeName,
                      "turnOverWise": info.TrunoverWise.toString(),
                      "symbolWise": info.SymbolWise.toString(),
                    })
                .toList(),
            selectedDataList:
                state.dataToUpdate[UserDetailsKeys.dtExchangeDtiBo.name] ?? [],
            onChange: (isSelected, data) {
              print(isSelected);
              userBloc
                  .add(UpdateExchangeDtData(data: data, isAdd: !isSelected));
            },
          ),
        );
      },
    );
  }
}
