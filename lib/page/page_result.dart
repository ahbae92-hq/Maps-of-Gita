import 'package:flutter/material.dart';
import 'package:maps_of_gita/model/model_category.dart';
import 'package:maps_of_gita/page/page_home.dart';
import 'package:maps_of_gita/page/page_quiz.dart';

class PageResult extends StatefulWidget {
  final int score;
  final int totalQuestion;
  final ModelCategory category;

  const PageResult({
    super.key,
    required this.score,
    required this.totalQuestion,
    required this.category,
  });

  @override
  State<PageResult> createState() => _PageResultState();
}

class _PageResultState extends State<PageResult> with TickerProviderStateMixin {
  String get resultMessage {
    double percentage = (widget.score / widget.totalQuestion) * 100;
    if (percentage >= 80) {
      return 'Luar Biasa';
    } else if (percentage >= 60) {
      return ' Kerja Bagus';
    } else if (percentage >= 40) {
      return 'Tidak Buruk';
    } else {
      return 'Coba Lagi';
    }
  }

  Color get resultColor {
    double percentage = (widget.score / widget.totalQuestion) * 100;
    if (percentage >= 80) {
      return Colors.green;
    } else if (percentage >= 60) {
      return Colors.blueAccent;
    } else if (percentage >= 40) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [resultColor.withOpacity(0.8), resultColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        size: 80,
                        color: Colors.amber,
                      ),
                      SizedBox(height: 24),
                      Text(
                        resultMessage,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2d3748),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Skor Kamu',
                        style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.score}',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: resultColor,
                              ),
                            ),
                            TextSpan(
                              text: ' / ${widget.totalQuestion}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                          elevation: 8,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PageQuiz(category: widget.category),
                            ),
                          );
                        },
                        child: Text(
                          'Coba Lagi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff2d3748),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageHome()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                        ),
                        child: Text(
                          'kembali',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
