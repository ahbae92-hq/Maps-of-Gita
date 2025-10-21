import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_of_gita/model/model_category.dart';
import 'package:maps_of_gita/page/page_quiz.dart';

import '../widget/category_card.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  List<ModelCategory> modelCategory = [
    ModelCategory(
      strName: 'Senilai',
      strIcon: Icons.lightbulb_outline,
      strColor: Color(0xFF6c63FF),
      strDesc: 'Tes Pecahan Senilai',
      questCount: 30,
    ),
    ModelCategory(
      strName: 'Desimal dan Persen',
      strIcon: Icons.percent,
      strColor: Color(0xFF00C853),
      strDesc: 'Tes Desimal Persen',
      questCount: 30,
    ),
    ModelCategory(
      strName: 'Hitung Pecahan',
      strIcon: Icons.cast_for_education,
      strColor: Color(0xFFE8624A),
      strDesc: 'Tes Hitung Pecahan',
      questCount: 30,
    ),
    ModelCategory(
      strName: 'Soal Cerita',
      strIcon: Icons.history,
      strColor: Color(0xFF28C8BD),
      strDesc: 'Tes Soal Cerita',
      questCount: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8F9FF), Color(0xFFE8EAFF), Color(0xFFF0F2FF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Siswa SDN Cimayang',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(122),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF2F7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.playlist_add_check_circle,
                        size: 32,
                        color: Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildStateItem(
                          'Total Soal',
                          '10+',
                          Icons.quiz,
                          Color(0xFF6C63FF),
                        ),
                      ),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(
                        child: buildStateItem(
                          'Total Kategori',
                          '4',
                          Icons.category,
                          Color(0xFF4ECDC4),
                        ),
                      ),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(
                        child: buildStateItem(
                          'Tingkat Kesulitan',
                          'Dasar',
                          Icons.trending_down,
                          Color.fromARGB(255, 118, 255, 64),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mulai Sekarang?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Ikuti kuis acak sekarang!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          final randomCategories =
                              (modelCategory.toList()..shuffle()).first;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PageQuiz(category: randomCategories),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE91e63),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        child: Text(
                          'Mulai',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Pilih Kategori Anda',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: modelCategory.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: modelCategory[index],
                      onTap: () {
                        HapticFeedback.lightImpact();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageQuiz(category: modelCategory[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStateItem(
    String strTitle,
    String strValue,
    IconData strIcon,
    Color strColor,
  ) {
    return Column(
      children: [
        Icon(strIcon, color: strColor, size: 24),
        SizedBox(height: 8),
        Text(
          strValue,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          strTitle,
          style: TextStyle(fontSize: 12, color: Color(0xFF2D3748)),
        ),
      ],
    );
  }
}
