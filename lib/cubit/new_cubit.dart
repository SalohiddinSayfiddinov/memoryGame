import 'dart:math';

import 'package:bloc/bloc.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  List lst1 = [];
  List lst2 = [];
  int right = 0;
  int wrong = 0;

  void showNumbers() {
    lst1.clear();
    for (var i = 0; i < 6; i++) {
      int random = Random().nextInt(10);
      lst1.add(random);
      lst2.add(lst1[i]);
    }

    emit(ShowNumbers());
    Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (value) => emit(HideNumbers()),
    );
    lst2.sort();
  }

  void checkNumbers(int num) {
    if (lst2.isNotEmpty) {
      if (num == lst2.first) {
        lst2.removeAt(0);
        right += 1;
        emit(ShowAnswers());
      } else {
        wrong += 1;
        emit(ShowAnswers());
      }
    }
    
  }
}

abstract class GameState {
  GameState();
}

class GameInitial extends GameState {
  GameInitial();
}

class ShowNumbers extends GameState {
  ShowNumbers();
}

class HideNumbers extends GameState {
  HideNumbers();
}

class CheckNumbers extends GameState {
  CheckNumbers();
}

class ShowAnswers extends GameState {
  ShowAnswers();
}
