import 'package:finance_app/data/top.dart';
import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final List<String> _list = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                BoldText(
                  text: 'Statistics',
                  color: AppColors.black,
                  size: 24,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              index_color = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 85,
                            decoration: BoxDecoration(
                              color: index_color == index
                                  ? AppColors.bgColor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: ModifiedText(
                              text: _list[index],
                              color: index_color == index
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 18,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        width: 120,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ModifiedText(
                              text: 'Expense',
                              color: AppColors.black,
                              fontSize: 20,
                            ),
                            const Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Chart(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                        text: 'Top Spending',
                        color: AppColors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.swap_vert,
                        size: 30,
                        color: Colors.grey.shade700,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Image.asset(
                  'assets/${geterTop()[index].image!}',
                  height: 40,
                ),
                title: BoldText(
                  text: geterTop()[index].name!,
                  color: AppColors.black,
                  size: 20,
                ),
                subtitle: ModifiedText(
                  text: geterTop()[index].time!,
                  color: Colors.grey,
                  fontSize: 16,
                ),
                trailing: ModifiedText(
                  text: geterTop()[index].fee!,
                  color: geterTop()[index].buy! ? Colors.red : Colors.green,
                  fontSize: 20,
                ),
              ),
              childCount: geterTop().length,
            ),
          ),
        ],
      )),
    );
  }
}
