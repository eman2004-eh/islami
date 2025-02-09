import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> arabicSuraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<String> englishSuraNames = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];
  List<int> ayatCounts = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    5,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    6,
    3,
    6,
    3,
    5,
    4,
    5,
    6,
  ];

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
            onChanged: (query) {
              searchSuraName(query); // Call search function when text changes
            },
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: textTheme.titleMedium
                  ?.copyWith(color: AppTheme.white.withOpacity(0.6)),
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
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Sura List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              // Show all Sura items if no search query is entered
              if (searchResutlsIndexes.isEmpty ||
                  searchResutlsIndexes.contains(index)) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to Sura details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuraDetailsScreen(
                          sura: Sura(
                            englishName: englishSuraNames[index],
                            arabicName: arabicSuraNames[index],
                            ayatCount: ayatCounts[index],
                            num: index,
                          ),
                        ),
                      ),
                    );
                  },
                  child: SuraItem(
                    Sura(
                      englishName: englishSuraNames[index],
                      arabicName: arabicSuraNames[index],
                      ayatCount: ayatCounts[index],
                      num: index,
                    ),
                  ),
                );
              } else {
                return SizedBox(); // Hide items that don't match the search query
              }
            },
            itemCount: englishSuraNames.length,
            separatorBuilder: (_, index) {
              // Show divider only if the item is visible
              if (searchResutlsIndexes.isEmpty ||
                  searchResutlsIndexes.contains(index)) {
                return Divider(
                  thickness: 1,
                  color: AppTheme.white,
                  indent: screenWidth * 0.1,
                  endIndent: screenWidth * 0.1,
                );
              } else {
                return SizedBox(); // Hide dividers for hidden items
              }
            },
          ),
        ),
      ],
    );
  }

  List<int> searchResutlsIndexes = [];

  void searchSuraName(String query) {
    setState(() {
      searchResutlsIndexes.clear();
      if (query.isEmpty) {
        // If the query is empty, show all Sura items
        return;
      }
      for (int i = 0; i < englishSuraNames.length; i++) {
        if (englishSuraNames[i].toLowerCase().contains(query.toLowerCase()) ||
            arabicSuraNames[i].contains(query)) {
          searchResutlsIndexes.add(i); // Add matching indices to the list
        }
      }
    });
  }
}

// SuraDetailsScreen (Example)
class SuraDetailsScreen extends StatelessWidget {
  final Sura sura;

  const SuraDetailsScreen({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sura.arabicName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Number of Ayat: ${sura.ayatCount}"),
          ],
        ),
      ),
    );
  }
}
