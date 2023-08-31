import 'package:flutter/material.dart';

import 'core/dependency_injection/injection_container.dart';
import 'features/common_main/common_main.dart';

void main() async {

  await injectDependencies();

  runApp(const MyApp());
}
