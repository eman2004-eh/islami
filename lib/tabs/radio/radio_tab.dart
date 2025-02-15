import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/radio/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF202020),
              ),
              child: TabBar(
                labelStyle: TextStyle(
                    color: AppTheme.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: TextStyle(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.primary,
                ),
                tabs: [
                  Tab(
                    text: 'Radio',
                  ),
                  Tab(
                    text: 'Reciters',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 20,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
