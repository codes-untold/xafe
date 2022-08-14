import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/models/expense_model.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';

import '../../constants/app_constants.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_text.dart';

class ExpenseHistory extends StatefulWidget {
  const ExpenseHistory(this.itemIndex, {Key? key}) : super(key: key);

  final int itemIndex;

  @override
  State<ExpenseHistory> createState() => _ExpenseHistoryState();
}

class _ExpenseHistoryState extends State<ExpenseHistory> {
  dynamic totalAmountSpent = 0;
  @override
  void initState() {
    super.initState();
    TransactionViewModel transactionViewModel =
        Provider.of(context, listen: false);
    dynamic expenseList =
        transactionViewModel.categoryList[widget.itemIndex].expenseList;
    for (int i = 0; i < expenseList.length; i++) {
      totalAmountSpent += expenseList[i].amount; //caluclate total expense
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TransactionViewModel>(
      builder: ((context, transactionViewModel, child) {
        print("cghgh");
        print(transactionViewModel
            .categoryList[widget.itemIndex].expenseList.length);
        return Scaffold(
            backgroundColor: appBlue,
            body: SafeArea(
                child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: appWhite,
                              ),
                            ),
                            CustomText.regular(
                                transactionViewModel
                                    .categoryList[widget.itemIndex].name,
                                color: appWhite),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => CustomBottomSheet());
                              },
                              child: const CircleAvatar(
                                backgroundColor: Color(0x10ffffff),
                                child: Icon(
                                  Icons.add,
                                  color: appWhite,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                          TextSpan(
                            text: '\$$totalAmountSpent.00 ',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: appWhite),
                            children: const [
                              TextSpan(
                                text: 'spent',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: appWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 5,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appWhite,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                flex: 7,
                              ),
                              Expanded(
                                child: Container(
                                  color: const Color(0x10ffffff),
                                ),
                                flex: 3,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0x10ffffff)),
                              child: CustomText.regular("\$1000/month",
                                  color: appWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: size.width * 0.2,
                            height: 5,
                            decoration: BoxDecoration(
                                color: const Color(0x10757866),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomText.medium("Expense History"),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: transactionViewModel.categoryList.isEmpty
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  itemBuilder: ((context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/category_img2.png",
                                                          width: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText.medium(
                                                                transactionViewModel
                                                                    .categoryList[
                                                                        widget
                                                                            .itemIndex]
                                                                    .expenseList[
                                                                        index]
                                                                    .name),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            CustomText.regular(
                                                                transactionViewModel
                                                                    .categoryList[
                                                                        widget
                                                                            .itemIndex]
                                                                    .expenseList[
                                                                        index]
                                                                    .date,
                                                                color: appGrey,
                                                                fontSize: 12),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: offWhite,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: CustomText.medium(
                                                        "\$${transactionViewModel.categoryList[widget.itemIndex].expenseList[index].amount}.00",
                                                        fontSize: 12))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                      )),
                                  itemCount: transactionViewModel
                                      .categoryList[widget.itemIndex]
                                      .expenseList
                                      .length,
                                  shrinkWrap: true,
                                ),
                        )
                      ],
                    ),
                    decoration: const BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                  ),
                )
              ],
            )));
      }),
    );
  }
}
