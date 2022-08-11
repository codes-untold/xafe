import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../widgets/custom_text.dart';

class ExpenseHistory extends StatelessWidget {
  const ExpenseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appBlue,
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: appWhite,
                        ),
                        CustomText.regular("Family", color: appWhite),
                        const CircleAvatar(
                          backgroundColor: Color(0x10ffffff),
                          child: Icon(
                            Icons.add,
                            color: appWhite,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text.rich(
                      TextSpan(
                        text: '\$200.00 ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: appWhite),
                        children: [
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
                      child: ListView.builder(
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText.medium(
                                                      "Bill payment"),
                                                  CustomText.regular("03/12/25",
                                                      color: appGrey,
                                                      fontSize: 12),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: offWhite,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: CustomText.medium("\$500.00",
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
                        itemCount: 5,
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
  }
}
