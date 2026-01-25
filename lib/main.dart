import 'package:flutter/material.dart';

import 'core/env/environment.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.init(forceEnv: AppEnvironment.uat);
  runApp(const MyApp());
}
