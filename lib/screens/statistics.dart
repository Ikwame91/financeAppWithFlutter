import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/utility.dart';
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
  final List<String> imagePaths = [
    "assets/Transfer.png",
    "assets/Education.png",
    "assets/Transportation.png",
    "assets/food.png",
  ];
  final List<String> _list = ['Day', 'Week', 'Month', 'Year'];
  List finance = [today(), week(), month(), year()];
  List<AddData> a = [];
  ValueNotifier kj = ValueNotifier(0);
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
      valueListenable: kj,
      builder: (context, value, child) {
        a = finance[value];
        return custom();
      },
    )));
  }

  CustomScrollView custom() {
    return CustomScrollView(
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
                            kj.value = index;
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
              Chart(
                index: index_color,
              ),
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
            (context, index) {
              var imageIndex = index % imagePaths.length;
              String imagePath = imagePaths[imageIndex];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    height: 40,
                  ),
                ),
                title: BoldText(
                  text: a[index].name,
                  size: 18,
                  color: AppColors.black,
                ),
                subtitle: ModifiedText(
                  text:
                      '${a[index].dateTime.year}  ${a[index].dateTime.day}-${a[index].dateTime.month}',
                  color: AppColors.black,
                  fontSize: 16,
                ),
                trailing: ModifiedText(
                  text: a[index].amont,
                  color:
                      a[index].choice == 'Income' ? Colors.green : Colors.red,
                  fontSize: 18,
                ),
              );
            },
            childCount: a.length,
          ),
        ),
      ],
    );
  }
}
