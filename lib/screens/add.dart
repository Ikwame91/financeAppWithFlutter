import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  FocusNode focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  String? selectedItem;
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

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
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
          dropDown(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
                focusNode: focusNode,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: "Amount",
                  labelStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 22,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 22,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.lightWhite, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.black, width: 2),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Padding dropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.bgColor,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ModifiedText(
                          text: e,
                          color: AppColors.black,
                          fontSize: 22,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map(
                (e) => Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: AppColors.bgColor,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ModifiedText(
                      text: e,
                      color: AppColors.black,
                      fontSize: 22,
                    ),
                  ],
                ),
              )
              .toList(),
          hint: ModifiedText(
            text: " Name",
            color: AppColors.black,
            fontSize: 22,
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: const SizedBox(),
        ),
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
