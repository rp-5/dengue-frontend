import 'package:dengue/core/theme/theme.dart';
import 'package:dengue/src/pages/human_edit.dart';
import 'package:dengue/src/pages/human_register.dart';
import 'package:dengue/src/pages/root_app.dart';
import 'package:dengue/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootApp(),
      routes: {
        AppRoutes.humanRegister: (_) => const HumanRegister(),
        AppRoutes.humanEdit: (_) => const HumanEdit()
      },
      theme: theme()));
}
