import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xafe/utilities/services.dart';
import 'package:xafe/utilities/toast.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';
import 'package:xafe/views/widgets/custom_button.dart';
import 'package:xafe/views/widgets/custom_text.dart';
import 'package:xafe/views/widgets/custom_textfield.dart';
import 'package:xafe/views/widgets/list_bottom_sheet.dart';
import 'package:xafe/views/widgets/option_tab.dart';

import '../../constants/app_constants.dart';

class AddExpense extends StatefulWidget {
  AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  String? selectedCategoryName;
  String? selectedCategoryId;

  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: ((context, transactionViewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appWhite,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: appBlack,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText.bold("Add an expense", fontSize: 25),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          inputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          hintText: "expense amount",
                          keyBoardType: TextInputType.number,
                          controller: amountController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => ListBottomSheet(
                                        SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: ((context, index) =>
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 16),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryName =
                                                            transactionViewModel
                                                                .categoryList[
                                                                    index]
                                                                .name;
                                                        selectedCategoryId =
                                                            transactionViewModel
                                                                .categoryList[
                                                                    index]
                                                                .CategoryID;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        CustomText.regular(
                                                            transactionViewModel
                                                                .categoryList[
                                                                    index]
                                                                .name),
                                                        const Divider()
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                            itemCount: transactionViewModel
                                                .categoryList.length,
                                          ),
                                        ),
                                      ));
                            },
                            child: OptionTab(
                                selectedCategoryName ?? "Select Category")),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: "expense name",
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: OptionTab(selectedDate ?? "date(dd/mm/yy)")),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.bold("Add Expense",
                            color: appWhite, fontSize: 14),
                        transactionViewModel.isScreenBusy
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints.tightFor(
                                      width: 15, height: 15),
                                  child: const CircularProgressIndicator(
                                    color: appWhite,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ), () {
                  addExpense(transactionViewModel);
                })
              ],
            ),
          )),
        );
      }),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = Service.dateFormater(picked.toString());
      });
    }
  }

  Future<void> addExpense(TransactionViewModel transactionViewModel) async {
    if (_formkey.currentState!.validate()) {
      if (selectedCategoryName == null || selectedDate == null) {
        showToastAlert(context, "Enter all fields", isSuccess: false);
        return;
      }
      bool result =
          await transactionViewModel.addExpenses(selectedCategoryId!, {
        "name": nameController.text,
        "date": selectedDate,
        "amount": int.parse(amountController.text)
      });
      if (result) {
        Navigator.pop(context);
      } else {
        showToastAlert(context, "Failed to add expense", isSuccess: false);
      }
    }
  }
}
