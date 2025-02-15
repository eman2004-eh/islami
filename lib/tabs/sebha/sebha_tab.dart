import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  int index = 0;

  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppTheme.white, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/sebha_head.png'),
            Padding(
              padding: EdgeInsets.only(top: height * 0.015),
              child: GestureDetector(
                onTap: () {
                  counter++;
                  if (counter % 33 == 0) {
                    index++;
                    if (index == azkar.length) {
                      index = 0;
                      counter = 0;
                    }
                  }
                  angle += 360 / 33;
                  setState(() {});
                },
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/sebha_body.png'),
                ),
              ),
            ),
            Positioned(
              top: height * 0.23,
              child: Column(
                children: [
                  Text(
                    azkar[index],
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$counter',
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
