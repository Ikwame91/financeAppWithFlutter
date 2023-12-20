import 'package:finance_app/screens/home.dart';
import 'package:finance_app/screens/statistics.dart';
import 'package:finance_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index = 0;
  List Screen = [
    const Home(),
    const Statistics(),
    const Home(),
    const Statistics(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.bgColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 7, top: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index == 0 ? AppColors.bgColor : Colors.grey[400],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index == 1 ? AppColors.bgColor : Colors.grey[400],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                  color: index == 2 ? AppColors.bgColor : Colors.grey[400],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: index == 3 ? AppColors.bgColor : Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
