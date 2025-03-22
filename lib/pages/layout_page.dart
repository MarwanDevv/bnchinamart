import 'package:bnchinamart/pages/account/account_page.dart';
import 'package:bnchinamart/pages/basket/basket_page.dart';
import 'package:bnchinamart/pages/home_page.dart';
import 'package:bnchinamart/utils/assets.dart';
import 'package:bnchinamart/utils/colors.dart';
import 'package:bnchinamart/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const BasketPage(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: pages[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: lightGreyColor,
        selectedFontSize: 14,
        unselectedFontSize: 11,
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(color: darkGreyColor),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: darkGreyColor,
        ),
        currentIndex: selectedPage,
        onTap: (index) {
          setState(
            () {
              selectedPage = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(homeIcon,
                  color: selectedPage == 0 ? primaryColor : darkGreyColor),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(basketIcon,
                  color: selectedPage == 1 ? primaryColor : darkGreyColor),
              label: "Basket"),
          const BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: AssetImage(avatarBoy),
                radius: 18,
              ),
              label: "Me"),
        ],
      ),
    );
  }
}
