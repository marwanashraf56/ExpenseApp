import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_lists/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.onRemoveExpense,
  });
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expensesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          color: Theme.of(context).colorScheme.error,
        ),
        onDismissed: (direction) => onRemoveExpense(expensesList[index]),
        key: ValueKey(expensesList[index]),
        child: ExpenseItem(
          expensesList[index],
        ),
      ),
    );
  }
}
