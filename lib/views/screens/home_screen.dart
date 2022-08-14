import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/utilities/services.dart';
import 'package:xafe/viewmodels/animation_view_model.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';
import 'package:xafe/views/screens/expense_history.dart';
import 'package:xafe/views/widgets/bottom_sheet.dart';
import 'package:xafe/views/widgets/custom_text.dart';
import 'package:xafe/views/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<TransactionViewModel, AnimationViewModel>(
      builder: ((context, transactionViewModel, animationViewModel, child) {
        return transactionViewModel.isScreenBusy
            ? const CustomLoader()
            : Scaffold(
                backgroundColor: appBlue,
                body: SafeArea(
                    child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0x10ffffff)),
                                    child: Row(
                                      children: [
                                        CustomText.regular("This week",
                                            color: appWhite),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: appWhite,
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) =>
                                              CustomBottomSheet());
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: appWhite,
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: appBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: appWhite,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            height: size.height *
                                                animationViewModel
                                                    .expenseBarHeight,
                                            width: 60,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText.bold("Expenses",
                                              color: appWhite, fontSize: 14),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          CustomText.extraBold(
                                              "\$${Service.textFormatter(animationViewModel.expenseText.toString())}.00",
                                              color: appWhite,
                                              key: const Key("expenseTextId"),
                                              fontSize: 20)
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: appWhite,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            height: size.height *
                                                animationViewModel
                                                    .incomeBarHeight,
                                            width: 60,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText.bold("Income",
                                              color: appWhite, fontSize: 14),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          CustomText.extraBold(
                                              "\$${Service.textFormatter(animationViewModel.incomeText.toString())}.00",
                                              color: appWhite,
                                              fontSize: 20),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              )
                            ],
                          )),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.2,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: const Color(0x10757866),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: ((context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      ExpenseHistory(index))));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/category_img${transactionViewModel.categoryList[index].categoryImgId}.png",
                                                          width: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CustomText.medium(
                                                            transactionViewModel
                                                                .categoryList[
                                                                    index]
                                                                .name)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                CustomText.medium("\$5000.00")
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                      ),
                                    )),
                                itemCount:
                                    transactionViewModel.categoryList.length,
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
