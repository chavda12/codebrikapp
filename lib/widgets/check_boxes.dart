import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final List<Map<String, String>> selectedDataList;
  final void Function(bool isSelected, Map<String, String> data) onChange;
  const CheckBoxes(
      {super.key,
      required this.dataList,
      required this.selectedDataList,
      required this.onChange});

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  @override
  Widget build(BuildContext context) {
    print(widget.selectedDataList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: 'Exchange Allow'),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              mainAxisExtent: 40),
          shrinkWrap: true,
          itemCount: widget.dataList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            final data = widget.dataList[index];
            bool isSelected = widget.selectedDataList
                    .indexWhere((el) => el['id'] == data['id']) !=
                -1;

            return CheckboxListTile(
              checkColor: blackColor,
              title: CustomText(title: widget.dataList[index]['name']),
              value: isSelected,
              onChanged: (_) {
               // setState(() {
                  widget.onChange(isSelected, data);
                // });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
      ],
    );
  }
}
