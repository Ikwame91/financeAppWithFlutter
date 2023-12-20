import 'package:finance_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index = 0;

  Widget buildIcon(IconData icon, int iconIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = iconIndex;
        });
      },
      child: Icon(
        icon,
        size: 30,
        color: index == iconIndex ? AppColors.bgColor : Colors.grey[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              buildIcon(Icons.home, 0),
              buildIcon(Icons.bar_chart_outlined, 1),
              const SizedBox(width: 25),
              buildIcon(Icons.account_balance_wallet_outlined, 2),
              buildIcon(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
    );
  }
}
