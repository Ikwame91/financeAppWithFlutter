import 'package:finance_app/data/money.dart';

List<Money> geterTop() {
  Money snapFood = Money();
  snapFood.time = 'jan 30,2022';
  snapFood.image = 'Transfer.png';
  snapFood.buy = true;
  snapFood.fee = '- \$ 100';
  snapFood.name = 'macdonald';
  Money snap = Money();
  snap.image = 'Transfer.png';
  snap.time = 'today';
  snap.buy = false;
  snap.name = 'Transfer';
  snap.fee = '- \$ 60';

  return [snapFood, snap];
}
