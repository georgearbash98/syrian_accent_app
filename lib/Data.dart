import './models/Question.dart';

const GOVERNORATES = const [
  'دمشق',
  'حلب',
  'حمص',
];

const DAMASCUS = const [
  Question(
    question: "مرَسّتأ",
    allAnswers: [
      'قليل ذوق',
      'ذكي',
      'مرتب',
    ],
    answerIndex: 2,
  ),
  Question(
    question: "مخستَك ",
    allAnswers: [
      'شديد الذكاء',
      'مريض',
      'غبي',
    ],
    answerIndex: 1,
  ),
  Question(
    question: "طأطأت زلعيمو",
    allAnswers: [
      'نفذ صبره',
      'بما معنى التعب الشديد',
      'معنى مجازي للعطش الشديد',
      'دونت كنو',
    ],
    answerIndex: 2,
  ),
];
