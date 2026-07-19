import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/styles.dart';


class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/logo.svg'),
        SizedBox(width: 10.w),
        Text(
          'DocDoc',
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}