import 'dart:math';
import 'package:answers/models/answer.dart';
import 'package:answers/services/repository.dart';

class Controller {
  Repository repo = Repository();

  Answer getAnswer() {
    final _random = new Random();
    Answer answer = repo.answers[_random.nextInt(repo.answers.length)];
    return answer;
  }
}
