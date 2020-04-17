import './models/Question.dart';
import './models/Accent.dart';

const ACCENTS = const [
  Accent( 'شامي', 'assets/images/Damascus.png', DAMASCUS),
  Accent( 'حلبي', 'assets/images/Damascus.png', DAMASCUS),
  Accent( 'حمصي', 'assets/images/Damascus.png', DAMASCUS),
  Accent( 'حموي', 'assets/images/Damascus.png', DAMASCUS),
  Accent( 'درعاوي', 'assets/images/Damascus.png', DAMASCUS),
  Accent( 'جزراوي', 'assets/images/Damascus.png', DAMASCUS),
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
