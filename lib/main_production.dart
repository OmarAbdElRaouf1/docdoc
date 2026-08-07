import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'core/routing/app_router.dart';

void main() async {
  await init();
  await ScreenUtilPlus.ensureScreenSize();

  runApp(DocApp(appRouter: AppRouter()));
}
