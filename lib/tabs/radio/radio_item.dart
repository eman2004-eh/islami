import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioItem extends StatefulWidget {
  RadioItem({super.key});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay = true;

  bool isFavorite = false;

  bool isVolumUp = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hadeth_footer.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.primary,
      ),
      child: Column(
        children: [
          Text('Radio Ibrahim Al-Akdar',
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  isFavorite = !isFavorite;
                  setState(() {});
                },
                icon: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: AppTheme.black,
                        size: 35,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: AppTheme.black,
                        size: 35,
                      ),
              ),
              IconButton(
                onPressed: () {
                  isPlay = !isPlay;
                  setState(() {});
                },
                icon: isPlay
                    ? const Icon(
                        Icons.play_arrow,
                        color: AppTheme.black,
                        size: 35,
                      )
                    : const Icon(
                        Icons.pause,
                        color: AppTheme.black,
                        size: 35,
                      ),
              ),
              IconButton(
                onPressed: () {
                  isVolumUp = !isVolumUp;
                  setState(() {});
                },
                icon: isVolumUp
                    ? const Icon(
                        Icons.volume_up,
                        color: AppTheme.black,
                        size: 35,
                      )
                    : const Icon(
                        Icons.volume_off,
                        color: AppTheme.black,
                        size: 35,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
