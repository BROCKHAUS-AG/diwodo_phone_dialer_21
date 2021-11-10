import 'package:diwodo_21/home/tabs/dialer/view/view.dart';
import 'package:flutter/material.dart';

class Dialer extends StatelessWidget {
  const Dialer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*BlocProvider(
      create: (_) => DialerCubit(),
      child:*/ const DialerView()/*,
    )*/;
  }
}
