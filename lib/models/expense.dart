import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  String title;
  double amount;
  Category category;
  DateTime date;
  String id;
  Expense({
    required this.amount,
    required this.title,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  Category category;
  List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(
      //filter out expenses belonging to this.category
      List<Expense> allExpense,
      this.category)
      : expenses = allExpense.where((expense) {
          //initialisor list
          return expense.category == category; //T/F
        }).toList(); //additional constructor function
  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
