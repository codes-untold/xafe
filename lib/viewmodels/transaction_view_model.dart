import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xafe/models/category_model.dart';
import 'package:xafe/models/expense_model.dart';

class TransactionViewModel extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  CollectionReference appData =
      FirebaseFirestore.instance.collection('appData');
  bool isScreenBusy = false;

  Future<void> fetchCatgeoriesExpenses() async {
    appData.get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        List<ExpenseModel> expenseList = [];
        FirebaseFirestore.instance
            .collection('appData/${element.id}/Expenses')
            .get()
            .then((QuerySnapshot subQuerySnapshot) {
          subQuerySnapshot.docs.forEach((subElement) {
            expenseList.add(ExpenseModel(subElement.get("name"),
                subElement.get("amount"), subElement.get("date")));
          });
        });
        categoryList.clear();
        categoryList.add(CategoryModel(
            element.id,
            element.get("categoryImgID"),
            element.get("name"),
            element.get("totalAmount"),
            element.get("date"),
            expenseList));
      }
      notifyListeners();
    });
  }

  Future<bool> addExpenses(
      String categoryID, Map<String, dynamic> expenseData) async {
    try {
      CollectionReference appData =
          FirebaseFirestore.instance.collection('appData/$categoryID/Expenses');
      isScreenBusy = true;
      notifyListeners();

      appData.add({
        "name": expenseData["name"],
        "date": expenseData["date"],
        "amount": expenseData["amount"]
      });

      await refreshData();
      isScreenBusy = false;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> refreshData() async {
    await fetchCatgeoriesExpenses();
    await Future.delayed(const Duration(seconds: 1), () {
      notifyListeners();
    });
  }
}
