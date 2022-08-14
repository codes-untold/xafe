import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/models/category_model.dart';
import 'package:xafe/models/expense_model.dart';
import 'package:xafe/utilities/services.dart';
import 'package:xafe/utilities/shared_preferences.dart';

class TransactionViewModel extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  CollectionReference appData =
      FirebaseFirestore.instance.collection("appData");

  bool isScreenBusy = false;
  final _auth = FirebaseAuth.instance;

  Future<void> fetchCategoriesExpenses() async {
    categoryList.clear();
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

        categoryList.add(CategoryModel(element.id, element.get("categoryImgID"),
            element.get("name"), element.get("date"), expenseList));
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

  Future<void> createCategory(String categoryName, String categoryImgId) async {
    isScreenBusy = true;
    notifyListeners();
    appData.add({
      "name": categoryName,
      "date": Service.dateFormater(DateTime.now().toString()),
      "categoryImgID": categoryImgId
    }).then((value) {
      appData.doc(value.id).collection("Expenses").add({
        "name": "miscellaneous",
        "date": Service.dateFormater(DateTime.now().toString()),
        "amount": 500
      });
    });
    await refreshData();
    isScreenBusy = false;
    notifyListeners();
  }

  Future<void> refreshData() async {
    await fetchCategoriesExpenses();
    await Future.delayed(const Duration(seconds: 1), () {
      notifyListeners();
    });
  }
}
