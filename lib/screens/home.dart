import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
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
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
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
                          text: " \$2,1504",
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
                              backgroundColor:
                                  Color.fromARGB(255, 85, 145, 141),
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
                              backgroundColor:
                                  Color.fromARGB(255, 85, 145, 141),
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
                  )
                ]),
              ))
        ]),
      ),
    );
  }
}
