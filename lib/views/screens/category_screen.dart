import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../widgets/custom_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appBlue,
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.regular("💻Categories",
                            color: appWhite, fontSize: 18),
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
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
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
                    CustomText.medium("4 Spending Categories"),
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
                                              color: const Color(0x10ff8514),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: CustomText.medium("remove",
                                              fontSize: 12, color: appGold))
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
