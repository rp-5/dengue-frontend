import 'package:dengue/core/theme/theme.dart';
import 'package:dengue/src/pages/root_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootApp(),
      theme: theme()));
}
