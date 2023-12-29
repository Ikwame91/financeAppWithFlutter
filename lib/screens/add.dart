import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:finance_app/widgets/custom_drop_down.dart';
import 'package:finance_app/widgets/simple_container.dart';
import 'package:finance_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<AddData>('data');
  DateTime? date = DateTime.now();
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
    'Income',
    "Expense",
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
      height: 550,
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
          const SizedBox(height: 30),
          Textfieldd(
            focusNode: focusNode,
            textEditingController: _textEditingController,
            text: "explain",
          ),
          const SizedBox(height: 30),
          Textfieldd(
            keyboardType: TextInputType.number,
            focusNode: numFocusnode,
            textEditingController: _numEditingController,
            text: "amount",
          ),
          const SizedBox(height: 30),
          CustomDropDown(
            items: _item2,
            hint: 'Choice',
            onChanged: (value) {
              setState(() {
                selectedItem2 = value;
              });
            },
          ),
          const SizedBox(height: 30),
          dateTime(),
          const Spacer(),
          GestureDetector(
            onTap: () {
              var add = AddData(
                name: selectedItem ?? "no data",
                explain: _textEditingController.text,
                amont: _numEditingController.text,
                choice: selectedItem2 ?? "No data",
                dateTime: date!,
              );
              box.add(add);

              Navigator.of(context).pop();
            },
            child: const SimpleContainer(
              text: 'Save',
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container dateTime() {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightWhite,
        ),
        width: 300,
        child: TextButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015),
              lastDate: DateTime(2050),
            );
            if (pickedDate != null) {
              setState(() {
                date = pickedDate;
              });
            }
          },
          child: Text(
            'Date : ${date!.day}/${date!.month}/${date!.year}',
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ));
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
