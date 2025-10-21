import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_of_gita/model/model_category.dart';
import 'package:maps_of_gita/model/model_question.dart';
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
  int currentQuestionIndex = 0;
  int yourScore = 0;
  int? selectedAnswer;
  bool isAnswered = false;

  List<ModelQuestion> modelQuestion = [
    ModelQuestion(
      strText: 'Menyundul bola sama juga dengan...',
      strListOptions: ['Passing', 'Heading', 'Block', 'Shooting'],
      strCorrectAnswer: 1,
    ),
    ModelQuestion(
      strText:
          'Sebuah lapangan berbentuk lingkaran dengan diameter 56 m.'
          'Di sekeliling lapangan akan dipasang lampu dengan jarak 4 m.'
          'Berapa banyak lampu yang diperlukan?',
      strListOptions: ['44 buah', '34 buah', '30 buah', '24 buah'],
      strCorrectAnswer: 0,
    ),
    ModelQuestion(
      strText: 'Tipe data untuk TRUE FALSE adalah...',
      strListOptions: ['String', 'Char', 'Boolean', 'Byte'],
      strCorrectAnswer: 2,
    ),
    ModelQuestion(
      strText: 'Kiamat kecil dikenal dengan istilah...',
      strListOptions: [
        'Kiamat Sugro',
        'Kiamat Qubro',
        'Kiamat Zalzalah',
        'Hari Akhir',
      ],
      strCorrectAnswer: 0,
    ),
    ModelQuestion(
      strText: 'Lagu kebangsaan indonesia adalah...',
      strListOptions: [
        'Tanah Airku',
        'Indonesia Pusaka',
        'Indonesia Merdeka',
        'Indonesia Raya',
      ],
      strCorrectAnswer: 3,
    ),
  ];

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

    Future.delayed(Duration(microseconds: 1500), () {
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
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => PageResult(
            score: yourScore,
            totalQuestion: modelQuestion.length,
            category: widget.category))
      );
    }
  }


  @override
  Widget build (BuildContext context){
    final question = modelQuestion[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.category.strColor!.withOpacity(0.1),
              widget.category.strColor!.withOpacity(0.05)
            ]
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context) => PageHome())
                      );
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Color(0xff2d3748),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.circular(4),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: (currentQuestionIndex + 1) / modelQuestion.length,
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
                    style: TextStyle(
                      color: Color(0xff2d3748),
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4)
                      ),
                    ]
                ),
                child: Text(
                  question.strText!,
                  style: TextStyle(
                    color: Color(0xff2d3748),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return AnswerCard(
                        text: question.strListOptions? [index] ?? "", 
                        isSelected: selectedAnswer == index, 
                        isCorrect: isAnswered && index == question.strCorrectAnswer, 
                        isWrong: isAnswered && index != question.strCorrectAnswer && selectedAnswer == index, 
                        onTap: () => selectAnswer(index), 
                        color: widget.category.strColor!,
                    );
                  }
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
