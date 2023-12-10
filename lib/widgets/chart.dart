import 'package:flutter/material.dart';
import 'package:personal_expanse_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanse_app/widgets/transaction_list.dart';

class Chart extends StatelessWidget {
  // const Chart({super.key});
  final List<transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount.toDouble();
        }
      }
      print(totalSum);
      print(DateFormat.E().format(weekDay));
      return {'DAY': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }


  @override
  Widget build(BuildContext context) {
    
    print(groupedTransactionValues);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
