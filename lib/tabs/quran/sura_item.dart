import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  final Sura sura; // Use final for immutable data

  const SuraItem(this.sura, {super.key}); // Add const and super.key

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        // Sura Number Frame
        Container(
          height: 48,
          width: 48,
          margin: const EdgeInsets.only(right: 24),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number_frame.png'),
            ),
          ),
          child: Text(
            '${sura.num}',
            style: textTheme.titleLarge,
          ),
        ),

        // Sura Details (English Name and Verse Count)
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

        // Spacer to push the Arabic name to the end
        const Spacer(),

        // Sura Arabic Name
        Text(
          sura.arabicName,
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}
