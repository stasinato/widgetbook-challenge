import 'package:flutter/material.dart';

/// Widget to display a future string
class FutureStringDisplayBox extends StatelessWidget {
  /// Creates a new instance of [FutureStringDisplayBox].
  const FutureStringDisplayBox({Key? key, required this.futureString})
      : super(key: key);

  /// [futureString] is the future for FutureBuilder
  final Future<String>? futureString;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futureString,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('There was an error, retry please!');
          } else {
            return Text(snapshot.data.toString());
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
