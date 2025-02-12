import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/most_recently_item.dart';
import 'package:islami/tabs/quran/sura_service.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: SuraService.mostRecently.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    MostRecentlyItem(SuraService.mostRecently.reversed.toList()[index]),
                itemCount: SuraService.mostRecently.length,
                separatorBuilder: (_, __) => SizedBox(width: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
