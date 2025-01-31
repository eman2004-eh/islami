import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> _tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/hadeth.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/sebha.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/radio.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/time.svg',
              colorFilter: ColorFilter.mode(
                currentIndex == 4 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
