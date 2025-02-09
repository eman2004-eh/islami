import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
  const SuraItem(this.sura, {super.key});

  final Sura sura;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: sura,
        );
      },
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            margin: EdgeInsets.only(right: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sura_number_frame.png'),
              ),
            ),
            child: Text(
              '${sura.num}',
              style: textTheme.titleLarge,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sura.englishName,
                style: textTheme.titleLarge,
              ),
              Text(
                '${sura.ayatCount} Verses',
                style: textTheme.titleSmall,
              ),
            ],
          ),
          Spacer(),
          Text(
            sura.arabicName,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
