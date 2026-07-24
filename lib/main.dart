import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  init();
  runApp(DocApp(appRouter: AppRouter()));
}
