import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/utility.dart';
import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imagePaths = [
    "assets/Transfer.png",
    "assets/Education.png",
    "assets/Transportation.png",
    "assets/food.png",
  ];

  // ignore: prefer_typing_uninitialized_variables
  var history;
  final box = Hive.box<AddData>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 350,
                    child: _head(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ModifiedText(
                          text: "Transaction History",
                          color: AppColors.black,
                          fontSize: 20,
                        ),
                        ModifiedText(
                          text: "See All",
                          color: AppColors.bgColor,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < box.length) {
                        // Checking if the index is within the valid range
                        history = box.values.toList()[index];
                        return getList(history, index);
                      } else {
                        return Container();
                      }
                    },
                    childCount: box.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget getList(AddData history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: transactionList(index, history));
  }

  ListTile transactionList(int index, AddData history) {
    var imageIndex = index % imagePaths.length;
    String imagePath = imagePaths[imageIndex];
    return ListTile(
      leading: ClipRRect(
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
      title: BoldText(
        text: history.name,
        size: 18,
        color: AppColors.black,
      ),
      subtitle: ModifiedText(
        text:
            '${day[history.dateTime.weekday - 1]}  ${history.dateTime.year}-${history.dateTime.day}-${history.dateTime.month}',
        color: AppColors.black,
        fontSize: 16,
      ),
      trailing: ModifiedText(
        text: history.amont,
        color: history.isInBox == 'Income' ? Colors.green : Colors.red,
        fontSize: 18,
      ),
    );
  }

  Widget _head() {
    return Stack(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                      child: const Icon(Icons.notification_add_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BoldText(
                        text: "Good Afternoon,",
                        size: 17,
                        color: Color(0xFFFFFFFF),
                      ),
                      BoldText(
                        text: "Nana Kwame",
                        size: 22,
                        color: AppColors.lightWhite,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
          left: 50,
          top: 180,
          child: Container(
            height: 170,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                  spreadRadius: 3,
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                        text: "Total Balance",
                        size: 19,
                        color: AppColors.lightWhite,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: AppColors.lightWhite,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Row(
                    children: [
                      BoldText(
                        text: " \$ ${total()}",
                        size: 20,
                        color: AppColors.lightWhite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          const SizedBox(width: 7),
                          ModifiedText(
                            text: "Income",
                            color: AppColors.lightWhite,
                            fontSize: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 13,
                            backgroundColor: Color.fromARGB(255, 85, 145, 141),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          const SizedBox(width: 7),
                          ModifiedText(
                            text: "Expense",
                            color: AppColors.lightWhite,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ModifiedText(
                        text: " \$2,1504",
                        fontSize: 20,
                        color: AppColors.lightWhite,
                      ),
                      ModifiedText(
                        text: " \$2,980",
                        fontSize: 20,
                        color: AppColors.lightWhite,
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
