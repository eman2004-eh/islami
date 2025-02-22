import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = '/sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late Sura sura;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    loadSuraFile();
  }

  Future<void> loadSuraFile() async {
    try {
      String suraFileContent =
          await rootBundle.loadString('assets/text/sura/${sura.num}.txt');
      ayat = suraFileContent.split('\r\n');
    } catch (e) {
      print('Error loading Sura file: $e');
      // Optionally, show an error message to the user
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppTheme.primary,
                      ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          isLoading
              ? LoadingIndicator()
              : Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                  ),
                ),
          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
