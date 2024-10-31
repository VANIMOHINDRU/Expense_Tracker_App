import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeentry});
  final List<Expense> expenses;
  final void Function(Expense expense) removeentry;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (cntx, index) {
          return Dismissible(
              //can delete the entry
              onDismissed: (direction) => removeentry(expenses[index]),
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: Theme.of(context).cardTheme.margin,
              ),
              child: ExpenseItem(expenses[index]));
        });
  }
}
