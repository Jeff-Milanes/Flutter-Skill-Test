import 'package:flutter/material.dart';
import 'package:xam_consulting_exam/core/dependency_injection.dart';
import 'package:xam_consulting_exam/presentation/app.dart';

void main() {
  ServiceLocator.registerDependencies();
  runApp(const App());
}
