import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'core/routing/routes.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'DocDoc',
          theme: ThemeData(primaryColor: AppColors.mainBlue),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoarding,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
