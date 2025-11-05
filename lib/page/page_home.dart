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
  // 🔹 Daftar kategori — harus sama dengan di QuestionBank
  List<ModelCategory> modelCategory = [
    ModelCategory(
      strName: 'Senilai',
      strIcon: Icons.lightbulb_outline,
      strColor: const Color(0xFF6C63FF),
      strDesc: 'Latihan mengenal pecahan senilai',
      questCount: 10,
    ),
    ModelCategory(
      strName: 'Desimal dan Persen',
      strIcon: Icons.percent,
      strColor: const Color(0xFF00C853),
      strDesc: 'Latihan konversi pecahan, desimal, dan persen',
      questCount: 10,
    ),
    ModelCategory(
      strName: 'Hitung Pecahan',
      strIcon: Icons.calculate_outlined,
      strColor: const Color(0xFFE8624A),
      strDesc: 'Latihan operasi hitung pecahan',
      questCount: 10,
    ),
    ModelCategory(
      strName: 'Soal Cerita',
      strIcon: Icons.book_outlined,
      strColor: const Color(0xFF28C8BD),
      strDesc: 'Latihan soal cerita pecahan',
      questCount: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F9FF),
              Color(0xFFE8EAFF),
              Color(0xFFF0F2FF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                // 🔹 Header sambutan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.playlist_add_check_circle,
                        size: 36,
                        color: Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // 🔹 Statistik ringkas
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: buildStateItem(
                          'Total Soal',
                          '40',
                          Icons.quiz,
                          const Color(0xFF6C63FF),
                        ),
                      ),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(
                        child: buildStateItem(
                          'Total Kategori',
                          '4',
                          Icons.category,
                          const Color(0xFF4ECDC4),
                        ),
                      ),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(
                        child: buildStateItem(
                          'Kesulitan',
                          'Dasar',
                          Icons.trending_down,
                          const Color(0xFF76FF03),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 🔹 Tombol mulai acak
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
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
                              'Coba kuis acak dari berbagai kategori!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          final randomCategory =
                              (modelCategory.toList()..shuffle()).first;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PageQuiz(category: randomCategory),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE91E63),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Mulai',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 🔹 Daftar kategori
                const Text(
                  'Pilih Kategori Anda',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

  // 🔹 Widget kecil untuk statistik di atas
  Widget buildStateItem(
      String strTitle, String strValue, IconData strIcon, Color strColor) {
    return Column(
      children: [
        Icon(strIcon, color: strColor, size: 28),
        const SizedBox(height: 8),
        Text(
          strValue,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          strTitle,
          style: const TextStyle(fontSize: 12, color: Color(0xFF2D3748)),
        ),
      ],
    );
  }
}
