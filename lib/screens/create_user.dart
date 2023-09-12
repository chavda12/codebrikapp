import 'package:codebrikapp/const/colors.dart';
import 'package:codebrikapp/custom/custom_text.dart';
import 'package:codebrikapp/custom/custom_textfields.dart';
import 'package:codebrikapp/utils/styles.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController creditController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController profitController = TextEditingController();
  final TextEditingController brkController = TextEditingController();
  List items = ['Master', 'Single'];
  List selectExchangeListIndex = [];
  List selectTradeListIndex = [];
  List exchangeList = [
    "N",
    "M",
    "S",
    "OTHERS",
    "CMX",
    "NCDX",
    "MINI",
    "SPOT",
    "CP"
  ];
  List tradeList = ["N", "M", "S", "CMX", "NCDX", "MINI"];
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    mobileController.dispose();
    cityController.dispose();
    creditController.dispose();
    remarkController.dispose();
    profitController.dispose();
    brkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
              userTypeRow(width),
              SizedBox(
                height: 10,
              ),
              personalDetails(),
              SizedBox(height: 15),
              profittlossSharing(),
              SizedBox(height: 15),
              exchangeAllow(),
              SizedBox(height: 15),
              tradeLimit(),
              SizedBox(
                height: 15,
              ),
              masterCheckbox(),
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
                onPressed: () {},
                child: CustomText(
                  title: 'CREATE',
                  style: ourStyle(color: whiteColor),
                ),
              ),
            );
  }

  Widget masterCheckbox() {
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
                value: this.valuefirst,
                onChanged: (bool? value) {
                  setState(() {
                    this.valuefirst = value!;
                  });
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
                value: this.valuesecond,
                onChanged: (bool? value) {
                  setState(() {
                    this.valuesecond = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tradeLimit() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title: 'High Low Between Trade Limit'),
          dynamicListForCheckbox(tradeList,selectTradeListIndex)
        ],
      ),
    );
  }

  Widget exchangeAllow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.3)),
      child: dynamicListForCheckbox(exchangeList,selectExchangeListIndex),
    );
  }

  Widget dynamicListForCheckbox(List<dynamic> list,List selectIndex) {
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
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return CheckboxListTile(
              checkColor: blackColor,
              title: CustomText(title: list[index]),
              value: selectIndex.contains(index),
              onChanged: (_) {
                print(selectIndex);
                if (selectIndex.contains(index)) {
                  setState(() {
                    selectIndex.remove(index); // unselect
                  });
                } else {
                  setState(() {
                    selectIndex.add(index); // select
                  });
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
      ],
    );
  }

  Widget profittlossSharing() {
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
          CustomTextFields(
              title: 'Profitt & Loss sharing*',
              controller: profitController,
              needSpace: false),
          CustomText(title: 'Our 80 | Remaining:0'),
          SizedBox(
            height: 15,
          ),
          CustomTextFields(
              title: 'Brk Sharing*',
              controller: profitController,
              needSpace: false),
          CustomText(title: 'Our 80 | Remaining:0'),
        ],
      ),
    );
  }

  Widget personalDetails() {
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
          CustomTextFields(title: 'Name**', controller: nameController),
          CustomTextFields(title: 'Username*', controller: usernameController),
          CustomTextFields(title: 'Password*', controller: passwordController),
          CustomTextFields(
              title: 'Retypr Password*', controller: retypePasswordController),
          CustomTextFields(
              title: 'Mobile Number', controller: mobileController),
          CustomTextFields(title: 'City', controller: cityController),
          CustomTextFields(title: 'Credit*', controller: creditController),
          CustomTextFields(title: 'Remark', controller: remarkController),
        ],
      ),
    );
  }

  Widget userTypeRow(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            title: 'User Type',
            style: ourStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
          width: 150,
          child: ExpansionTile(
            iconColor: Colors.black,
            title: Text(
              items[0],
              style: ourStyle(),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  items[1],
                  style: ourStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
