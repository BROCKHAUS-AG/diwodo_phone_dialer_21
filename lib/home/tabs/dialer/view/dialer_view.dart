import 'package:diwodo_21/app/models/app_state_manager.dart';
import 'package:diwodo_21/home/tabs/dialer/cubit/dialer_cubit.dart';
import 'package:diwodo_21/home/tabs/dialer/view/view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:provider/provider.dart';

class DialerView extends StatefulWidget {
  const DialerView({Key? key}) : super(key: key);

  @override
  _DialerViewState createState() => _DialerViewState();
}

class _DialerViewState extends State<DialerView> {
  String? _normalizedNumber;

  _normalizePhoneNumber(String number) async {
    if (await isValidPhoneNumber(number)) {
      await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: number, isoCode: 'DE')
          .then((value) => {
                setState(() {
                  _normalizedNumber = value;
                })
              });
    } else {
      setState(() {
        _normalizedNumber = number;
      });
    }
  }

  Future<bool> isValidPhoneNumber(String number) async {
    var isValid = await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: number, isoCode: 'DE');
    return isValid ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('diwodo Phone Dialer'),
      ),
      body: Center(
        child: BlocBuilder<DialerCubit, String>(
          buildWhen: (prevState, state) {
            if (prevState != state) {
              _normalizePhoneNumber(state);
            }
            return prevState != state;
          },
          builder: (context, state) {
            _callNumber() async {
              if (await isValidPhoneNumber(state)) {
                await FlutterPhoneDirectCaller.callNumber(state);
              } else {
                const snackbar =
                    SnackBar(content: Text('Keine gültige Telefonnummer!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            }

            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Provider.of<AppStateManager>(context).isDarkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            _normalizedNumber != null
                                ? _normalizedNumber.toString()
                                : '',
                            style: const TextStyle(fontSize: 24.0),
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              context.read<DialerCubit>().deleteLastDigit(),
                          icon: const Icon(Icons.backspace_rounded),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                const DialPad(),
                const SizedBox(height: kIsWeb ? 16 : 0),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () => _callNumber(),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff00ff00),
                          ),
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OtherScreen())),
      ),
    );
  }
}
