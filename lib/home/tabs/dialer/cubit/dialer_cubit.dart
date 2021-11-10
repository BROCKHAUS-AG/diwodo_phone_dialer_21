import 'package:bloc/bloc.dart';

class DialerCubit extends Cubit<String> {
  DialerCubit() : super('');

  void addZero() => emit(state + '0');

  void addOne() => emit(state + '1');

  void addTwo() => emit(state + '2');

  void addThree() => emit(state + '3');

  void addFour() => emit(state + '4');

  void addFive() => emit(state + '5');

  void addSix() => emit(state + '6');

  void addSeven() => emit(state + '7');

  void addEight() => emit(state + '8');

  void addNine() => emit(state + '9');

  void addPlus() => emit(state + '+');

  void addHashtag() => emit(state + '#');

  void addNumberFromContact(String phoneNumber) => emit(phoneNumber);

  void deleteLastDigit() => {
        if (state.isNotEmpty) {emit(state.substring(0, state.length - 1))}
      };
}
