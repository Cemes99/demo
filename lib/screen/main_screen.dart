import 'package:demo/constants.dart';
import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/cart_page.dart';
import 'package:demo/pages/favorite_page.dart';
import 'package:demo/pages/profile_page.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  late List<Widget> pages;
  late Widget selectedPage;
  late HomePage homePage;
  late CartPage cartPage;
  late FavoritePage favoritePage;
  late ProfilePage profilePage;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedPage = pages[index];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homePage = const HomePage();
    cartPage = const CartPage();
    favoritePage = const FavoritePage();
    profilePage = const ProfilePage();

    pages = [homePage, cartPage, favoritePage, profilePage];
    selectedPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: selectedPage
      ),

      bottomNavigationBar: BottomNavigationBar(
        // fix style of item
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}