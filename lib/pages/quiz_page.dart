import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../ui/answers_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';


class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Questions currentQuestion;
  Quiz quiz = new Quiz([
    new Questions("Toussez vous?", false),
    new Questions("respirez vous bien?", false),
    new Questions("Avez vous mal a la gorge?", false),
//    new Questions("Toussez vous?", false),
  ]);
  String questionText;
  int questionNomber;
  bool isCorrect;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNomber = quiz.questionIndex;
  }

  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("Vous avez dit Oui")),
            new QuestionText("Vous avez le corona", 1),
            new AnswerButton(false, () => print("Vous avez dit Non")),
          ],
        ),
        new CorrectWrongOverlay(true),
      ],
    );
  }
}
