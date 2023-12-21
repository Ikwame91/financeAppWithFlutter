import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:finance_app/widgets/custom_drop_down.dart';
import 'package:finance_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  FocusNode focusNode = FocusNode();
  FocusNode numFocusnode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _numEditingController = TextEditingController();

  String? selectedItem;
  String? selectedItem2;
  final List<String> _item = [
    'Food',
    'Transport',
    'Shopping',
    'Bills',
    'Entertainment',
    'Health',
    'Education',
    'Other'
  ];
  final List<String> _item2 = [
    'Food',
    'Transport',
    'Shopping',
    'Education',
    'Other'
  ];

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
    numFocusnode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          backgroundContainer(context),
          Positioned(
            top: 120,
            child: mainContainer(),
          )
        ],
      )),
    );
  }

  Container mainContainer() {
    return Container(
      height: 500,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomDropDown(
            items: _item,
            hint: 'Name',
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Textfieldd(
            focusNode: focusNode,
            textEditingController: _textEditingController,
            text: "explain",
          ),
          const SizedBox(
            height: 20,
          ),
          Textfieldd(
            keyboardType: TextInputType.number,
            focusNode: numFocusnode,
            textEditingController: _numEditingController,
            text: "amount",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropDown(
            items: _item2,
            hint: 'Choice',
            onChanged: (value) {
              setState(() {
                selectedItem2 = value;
              });
            },
          )
        ],
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    BoldText(
                      text: " Adding",
                      color: AppColors.black,
                      size: 22,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.attach_file_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
