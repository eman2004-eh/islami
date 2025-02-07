import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected_icon.dart';
import 'package:islami/nav_bar_unselected-icon.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; // Default to the first tab

  // List of tabs to display
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  // List of background image names corresponding to each tab
  List<String> backgroundImagesNames = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    // Debug print to check the current index

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/${backgroundImagesNames[currentIndex]}.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            Expanded(
              child: tabs[currentIndex], // Display the selected tab
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'quran'),
            activeIcon: NavBarSelectedIcon(imageName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'hadeth'),
            activeIcon: NavBarSelectedIcon(imageName: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'sebha'),
            activeIcon: NavBarSelectedIcon(imageName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'radio'),
            activeIcon: NavBarSelectedIcon(imageName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(imageName: 'time'),
            activeIcon: NavBarSelectedIcon(imageName: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
