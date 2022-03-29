import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/models/user.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(''),
      child: const App(),
    ),
  );
}
