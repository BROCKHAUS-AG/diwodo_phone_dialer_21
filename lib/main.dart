import 'package:bloc/bloc.dart';
import 'package:diwodo_21/app/app.dart';
import 'package:diwodo_21/home/tabs/dialer/dialer_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = DialerObserver();
  runApp(const App());
}
