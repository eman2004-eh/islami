import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  HadethItem({required this.index});

  int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadethFile();
    }
    double screenheight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          HadethDetailsScreen.routeName,
          arguments: hadeth,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color: AppTheme.primary, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_header_left.png',
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        style: textTheme.headlineSmall?.copyWith(
                          color: AppTheme.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_header_right.png',
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/hadeth_card_backgroung.png'),
                      fit: BoxFit.fill),
                ),
                child: hadeth == null
                    ? LoadingIndicator(
                        color: AppTheme.black,
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        itemBuilder: (_, index) => Text(
                          hadeth!.content[index],
                          style: textTheme.titleMedium?.copyWith(
                            color: AppTheme.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        itemCount: hadeth!.content.length,
                        separatorBuilder: (_, __) => SizedBox(height: 4),
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadethFile() async {
    String hadethFileContent = await rootBundle
        .loadString('assets/text/hadeth/h${widget.index + 1}.txt');
    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
