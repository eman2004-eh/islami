import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/most_recently_section.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_item.dart';
import 'package:islami/tabs/quran/sura_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: textTheme.titleMedium?.copyWith(
                color: AppTheme.white.withOpacity(0.6),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/icons/quran.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppTheme.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppTheme.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: textTheme.titleMedium,
            onChanged: (query) {
              SuraService.searchSuraName(query);
              setState(() {});
            },
          ),
        ),
        MostRecentlySection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Sura List',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: SuraService.searchResults.isEmpty
              ? Center(
                  child: Text(
                    'No results found',
                    style: textTheme.titleMedium,
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (_, index) {
                    Sura sura = SuraService.searchResults[index];
                    return InkWell(
                      onTap: () async {
                        SuraService.addSuraToMostRecently(sura);
                        await Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: sura,
                        );
                        setState(() {});
                      },
                      child: SuraItem(sura),
                    );
                  },
                  itemCount: SuraService.searchResults.length,
                  separatorBuilder: (_, index) => Divider(
                    thickness: 1,
                    color: AppTheme.white,
                    indent: screenWidth * 0.1,
                    endIndent: screenWidth * 0.1,
                  ),
                ),
        ),
      ],
    );
  }
}
