import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';
import 'package:xafe/views/screens/category_screen.dart';
import 'package:xafe/views/screens/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    Container()
  ];

  void onItemTapped(int index) {
    if (index == 2) {
      return;
    }
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    TransactionViewModel transactionViewModel =
        Provider.of(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      transactionViewModel.fetchCatgeoriesExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: appBlack,
                      size: 15,
                    )
                  : const Icon(
                      Icons.home_filled,
                      color: appGrey,
                      size: 15,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? const Icon(
                      Icons.search,
                      color: appBlack,
                      size: 15,
                    )
                  : const Icon(
                      Icons.search,
                      color: appGrey,
                      size: 15,
                    ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? const Icon(
                      Icons.stop_circle,
                      color: appBlack,
                      size: 15,
                    )
                  : const Icon(
                      Icons.stop_circle,
                      color: appGrey,
                      size: 15,
                    ),
              label: "Budget"),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: appBlack,
        unselectedItemColor: appGrey,
        selectedLabelStyle: const TextStyle(color: appBlack, fontSize: 10.0),
        unselectedLabelStyle: const TextStyle(color: appGrey, fontSize: 10.0),
      ),
    );
  }
}
