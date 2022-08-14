import 'package:xafe/models/expense_model.dart';

class CategoryModel {
  String CategoryID;
  String name;

  String categoryImgId;
  String date;
  List<ExpenseModel> expenseList;

  CategoryModel(this.CategoryID, this.categoryImgId, this.name, this.date,
      this.expenseList);
}
