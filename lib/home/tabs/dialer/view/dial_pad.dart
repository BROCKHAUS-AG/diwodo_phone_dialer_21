import 'package:diwodo_21/home/tabs/dialer/cubit/dialer_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialPad extends StatelessWidget {
  const DialPad({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialerCubit, String>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addOne(),
                    child: const Text('1')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addTwo(),
                    child: const Text('2')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addThree(),
                    child: const Text('3')),
              ],
            ),
            const SizedBox(height: kIsWeb ? 16 : 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addFour(),
                    child: const Text('4')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addFive(),
                    child: const Text('5')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addSix(),
                    child: const Text('6')),
              ],
            ),
            const SizedBox(height: kIsWeb ? 16 : 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addSeven(),
                    child: const Text('7')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addEight(),
                    child: const Text('8')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addNine(),
                    child: const Text('9')),
              ],
            ),
            const SizedBox(height: kIsWeb ? 16 : 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addPlus(),
                    child: const Text('+')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addZero(),
                    child: const Text('0')),
                ElevatedButton(
                    onPressed: () => context.read<DialerCubit>().addHashtag(),
                    child: const Text('#')),
              ],
            ),
          ],
        );
      },
    );
  }
}
