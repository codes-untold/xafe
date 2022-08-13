import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';

import '../../constants/app_constants.dart';
import '../../utilities/toast.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/list_bottom_sheet.dart';
import '../widgets/option_tab.dart';

class CreateCategory extends StatefulWidget {
  CreateCategory({Key? key}) : super(key: key);

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  List<String> categoryImageIds = ["1", "2", "3", "4"];

  String? selectedImageId;

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: ((context, transactionViewModel, child) {
        return Scaffold(
          backgroundColor: appWhite,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Icon(
                        Icons.arrow_back_ios,
                        color: appBlack,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText.bold("Add a spending category", fontSize: 25),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: _formkey,
                          child: CustomTextField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field can't be empty";
                                }
                                return null;
                              },
                              hintText: "Enter Category Name")),
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
                                                          bottom: 8),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedImageId =
                                                                categoryImageIds[
                                                                    index];
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Image.asset(
                                                          "assets/images/category_img${categoryImageIds[index]}.png",
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ),
                                                      const Divider()
                                                    ],
                                                  ))),
                                          itemCount: categoryImageIds.length,
                                        ),
                                      ),
                                    ));
                          },
                          child: Row(
                            children: [
                              selectedImageId != null
                                  ? Image.asset(
                                      "assets/images/category_img$selectedImageId.png",
                                      width: 15,
                                    )
                                  : const SizedBox.shrink(),
                              const Expanded(
                                  child: OptionTab("Choose Category emoji")),
                            ],
                          )),
                    ],
                  ),
                ),
                CustomButton(
                    CustomText.bold("Create Category",
                        color: appWhite, fontSize: 14), () {
                  if (_formkey.currentState!.validate()) {
                    if (selectedImageId == null) {
                      showToastAlert(context, "Select Category Image",
                          isSuccess: false);
                      return;
                    }
                  }
                })
              ],
            ),
          )),
        );
      }),
    );
  }
}
