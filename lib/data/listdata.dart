import 'package:finance_app/data/Money.dart';

List<Money> geter() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'Transfer.png';
  upwork.buy = true;

  Money starbucks = Money();
  starbucks.fee = '158';
  starbucks.image = 'Transfer.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';
  starbucks.buy = false;

  Money trasfer = Money();
  trasfer.fee = '100';
  trasfer.image = 'Transfer.png';
  trasfer.name = 'trasfer for sam';
  trasfer.time = 'jan 30,2022';
  trasfer.buy = true;
  return [upwork, starbucks, trasfer, upwork, starbucks, trasfer];
}
