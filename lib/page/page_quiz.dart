import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_of_gita/model/model_category.dart';
import 'package:maps_of_gita/model/model_question.dart';
import 'package:maps_of_gita/model/model_question_bank.dart';
import 'package:maps_of_gita/page/page_home.dart';
import 'package:maps_of_gita/page/page_result.dart';
import '../widget/answer_card.dart';

class PageQuiz extends StatefulWidget {
  final ModelCategory category;

  const PageQuiz({super.key, required this.category});

  @override
  State<PageQuiz> createState() => _PageQuizState();
}

class _PageQuizState extends State<PageQuiz> with TickerProviderStateMixin {
  late List<ModelQuestion> modelQuestion;
  int currentQuestionIndex = 0;
  int yourScore = 0;
  int? selectedAnswer;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    // 🔹 Ambil soal berdasarkan kategori dari QuestionBank
    modelQuestion = QuestionBank.getQuestions(widget.category.strName!);
    modelQuestion.shuffle(); // acak soal agar tidak urut
  }

  void selectAnswer(int answerIndex) {
    if (isAnswered) return;

    setState(() {
      selectedAnswer = answerIndex;
      isAnswered = true;
    });

    HapticFeedback.lightImpact();

    if (answerIndex == modelQuestion[currentQuestionIndex].strCorrectAnswer) {
      yourScore++;
    }

    // Ganti pertanyaan setelah 1,5 detik
    Future.delayed(const Duration(milliseconds: 1500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < modelQuestion.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        isAnswered = false;
      });
    } else {
      // 🔹 Selesai: ke halaman hasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PageResult(
            score: yourScore,
            totalQuestion: modelQuestion.length,
            category: widget.category,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = modelQuestion[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.category.strColor!.withOpacity(0.1),
              widget.category.strColor!.withOpacity(0.05),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // 🔹 Progress bar & tombol keluar
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageHome(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.close, size: 30, color: Color(0xff2d3748)),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor:
                            (currentQuestionIndex + 1) / modelQuestion.length,
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.category.strColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${currentQuestionIndex + 1} / ${modelQuestion.length}',
                    style: const TextStyle(
                      color: Color(0xff2d3748),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 🔹 Teks pertanyaan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
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
                child: Text(
                  question.strText!,
                  style: const TextStyle(
                    color: Color(0xff2d3748),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // 🔹 Pilihan jawaban
              Expanded(
                child: ListView.builder(
                  itemCount: question.strListOptions!.length,
                  itemBuilder: (context, index) {
                    return AnswerCard(
                      text: question.strListOptions![index],
                      isSelected: selectedAnswer == index,
                      isCorrect:
                          isAnswered && index == question.strCorrectAnswer,
                      isWrong:
                          isAnswered &&
                          index != question.strCorrectAnswer &&
                          selectedAnswer == index,
                      onTap: () => selectAnswer(index),
                      color: widget.category.strColor!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
