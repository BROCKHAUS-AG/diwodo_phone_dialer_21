import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class DialerObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
    super.onChange(bloc, change);
  }
}