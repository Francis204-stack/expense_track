import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

//each expense item is a card with the title, amount, date, and category of the expense.
//The list of expenses is displayed using a ListView.builder which is more efficient for long lists.
//Each expense item can be dismissed by swiping it to the left or right, which will trigger the onRemoveExpense callback to remove it from the list.
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    //column is a widget used when widgets are to be displayed on top of each other.
    //But in this case, column isn't a good choice because we don't know the exact number of expenses that will be there; so we use the ListView widget.
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
