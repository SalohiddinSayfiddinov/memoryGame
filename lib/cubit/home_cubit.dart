import 'package:bloc/bloc.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountInitial());

  int count = 0;

  void changeValue(String symbol) {
    if (symbol == '+') {
      count += 1;
    } else {
      count -= 1;
    }
    emit(CountChange());
  }

  startTimer() async {
    for (var i = count; i > 0; i -= 1) {
      Future.delayed(
        Duration(seconds: i),
      ).then((value) {
        count -= 1;
        if (count == 0) {
          emit(CountZero());
        }
        emit(CountChange());
      });
    }
  }
}

abstract class CountState {
  CountState();
}

class CountInitial extends CountState {
  CountInitial();
}

class CountChange extends CountState {
  CountChange();
}

class CountZero extends CountState {
  CountZero();
}
