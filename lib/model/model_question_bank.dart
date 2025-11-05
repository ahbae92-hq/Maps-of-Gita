import 'package:maps_of_gita/model/model_question.dart';
import 'dart:math';

class QuestionBank {
  static List<ModelQuestion> getQuestions(String? categoryName) {
    final random = Random();

    List<ModelQuestion> questions;

    switch (categoryName) {

      case 'Senilai':
        questions = [
          ModelQuestion(
            strText: 'Pecahan senilai dari 1/2 adalah...',
            strListOptions: ['2/4', '3/5', '4/6', '5/8'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Manakah yang merupakan pecahan senilai dengan 3/6?',
            strListOptions: ['2/3', '1/2', '3/4', '4/8'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: 'Pecahan 5/10 jika disederhanakan menjadi...',
            strListOptions: ['1/5', '1/2', '2/5', '3/4'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: 'Pecahan senilai dari 2/3 adalah...',
            strListOptions: ['4/6', '3/5', '5/8', '2/6'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '3/9 setara dengan pecahan...',
            strListOptions: ['1/3', '1/2', '2/3', '1/6'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Pecahan 4/8 dapat disederhanakan menjadi...',
            strListOptions: ['1/2', '3/4', '2/4', '1/4'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Pecahan yang senilai dengan 5/15 adalah...',
            strListOptions: ['1/3', '2/5', '3/4', '1/4'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Pecahan senilai dari 6/9 adalah...',
            strListOptions: ['2/3', '3/5', '1/3', '3/4'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Manakah pecahan yang senilai dengan 2/5?',
            strListOptions: ['4/10', '3/6', '1/2', '2/6'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: 'Pecahan 8/12 jika disederhanakan menjadi...',
            strListOptions: ['2/3', '1/2', '3/4', '1/3'],
            strCorrectAnswer: 0,
          ),
        ];
        break;

      case 'Desimal dan Persen':
        questions = [
          ModelQuestion(
            strText: '0,5 dalam bentuk persen adalah...',
            strListOptions: ['5%', '50%', '0,5%', '500%'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: '75% dalam bentuk pecahan adalah...',
            strListOptions: ['3/4', '1/2', '1/3', '2/5'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '0,25 sama dengan pecahan...',
            strListOptions: ['1/2', '1/4', '1/5', '2/5'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: 'Persen dari 20 per 100 adalah...',
            strListOptions: ['10%', '20%', '30%', '40%'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: '0,75 dalam bentuk persen adalah...',
            strListOptions: ['25%', '50%', '75%', '100%'],
            strCorrectAnswer: 2,
          ),
          ModelQuestion(
            strText: '1% dalam bentuk desimal adalah...',
            strListOptions: ['0,01', '0,1', '1,0', '0,001'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '0,4 = ...%',
            strListOptions: ['4%', '40%', '0,4%', '400%'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: '2/5 dalam bentuk desimal adalah...',
            strListOptions: ['0,25', '0,3', '0,4', '0,5'],
            strCorrectAnswer: 2,
          ),
          ModelQuestion(
            strText: '1/8 dalam bentuk desimal adalah...',
            strListOptions: ['0,125', '0,25', '0,5', '0,75'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '60% dalam bentuk pecahan sederhana adalah...',
            strListOptions: ['3/4', '2/3', '3/5', '4/5'],
            strCorrectAnswer: 2,
          ),
        ];
        break;

      case 'Hitung Pecahan':
        questions = [
          ModelQuestion(
            strText: '1/2 + 1/4 = ...',
            strListOptions: ['3/4', '2/6', '1/6', '1/8'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '3/4 - 1/2 = ...',
            strListOptions: ['1/4', '1/2', '2/4', '3/8'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '2/3 × 3/4 = ...',
            strListOptions: ['1/2', '1/3', '1/4', '1/6'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '3/5 ÷ 1/2 = ...',
            strListOptions: ['3/10', '6/5', '2/3', '5/3'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: '1/6 + 1/3 = ...',
            strListOptions: ['1/2', '1/3', '2/6', '1/9'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '2/5 + 3/5 = ...',
            strListOptions: ['5/10', '1', '4/5', '1/2'],
            strCorrectAnswer: 2,
          ),
          ModelQuestion(
            strText: '4/7 - 2/7 = ...',
            strListOptions: ['1/7', '2/7', '3/7', '4/7'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText: '1/2 × 2/3 = ...',
            strListOptions: ['1/3', '1/2', '2/3', '3/4'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText: '5/6 ÷ 1/2 = ...',
            strListOptions: ['5/12', '10/6', '5/3', '2/5'],
            strCorrectAnswer: 2,
          ),
          ModelQuestion(
            strText: '3/8 + 1/8 = ...',
            strListOptions: ['1/2', '3/4', '4/8', '1/4'],
            strCorrectAnswer: 0,
          ),
        ];
        break;

      case 'Soal Cerita':
        questions = [
          ModelQuestion(
            strText:
                'Ibu memiliki 1/2 liter minyak. Digunakan 1/4 liter. Berapa liter minyak yang tersisa?',
            strListOptions: ['1/4 liter', '1/2 liter', '3/4 liter', '1 liter'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Ani makan 2/5 bagian kue, dan Budi makan 1/5 bagian. Berapa bagian kue yang sudah dimakan?',
            strListOptions: ['3/5', '2/5', '4/5', '1/5'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Sebuah tangki berisi 3/4 penuh air. Jika dipakai 1/2 isinya, berapa bagian air yang tersisa?',
            strListOptions: ['3/8', '1/4', '1/8', '1/2'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Deni membaca 2/3 bagian buku di hari pertama, dan 1/6 di hari kedua. Sisa buku yang belum dibaca adalah...',
            strListOptions: ['1/3', '1/6', '1/4', '1/9'],
            strCorrectAnswer: 1,
          ),
          ModelQuestion(
            strText:
                'Sebuah pita panjangnya 2 meter. Dipotong 3/4 meter. Sisa pita sekarang adalah...',
            strListOptions: ['1 1/4 m', '1/4 m', '1 1/2 m', '1 m'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Sebuah kue dibagi menjadi 8 bagian sama. Rina makan 3 bagian. Bagian kue yang dimakan adalah...',
            strListOptions: ['3/8', '5/8', '1/4', '1/2'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Ayah memiliki 3/5 hektar sawah, dijual 1/5 bagian. Sisa sawah Ayah adalah...',
            strListOptions: ['2/5', '3/5', '4/5', '1/5'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Lina memiliki 1/3 kg gula. Ia membeli lagi 2/3 kg. Jumlah gula Lina sekarang adalah...',
            strListOptions: ['1 kg', '2/3 kg', '3/4 kg', '1/2 kg'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Rudi memiliki pita 5/6 meter. Ia gunakan 1/3 meter. Sisa pita Rudi adalah...',
            strListOptions: ['1/2 m', '3/6 m', '1/3 m', '5/9 m'],
            strCorrectAnswer: 0,
          ),
          ModelQuestion(
            strText:
                'Dalam lomba makan kerupuk, Beni memakan 3/4 bagian kerupuk, Susi 1/2 bagian. Siapa yang lebih banyak makan?',
            strListOptions: ['Beni', 'Susi', 'Sama banyak', 'Tidak diketahui'],
            strCorrectAnswer: 0,
          ),
        ];
        break;

      // 🔹 DEFAULT
      default:
        questions = [];
        break;
    }

    questions.shuffle(random);
    return questions;
  }
}
