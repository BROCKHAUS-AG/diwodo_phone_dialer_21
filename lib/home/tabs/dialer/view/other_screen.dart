import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back to Dialer'),
        ),
      ),
    );
  }
}
