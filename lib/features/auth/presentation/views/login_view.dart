import 'package:docdoc/core/theme/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/manager/login/login_state.dart';
import 'package:docdoc/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:docdoc/features/auth/presentation/views/widgets/email_and_password.dart';
import 'package:docdoc/features/auth/presentation/views/widgets/login_bloc_listener.dart';
import 'package:docdoc/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back', style: TextStyles.font24BlueBold),
                  Gap(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font14GrayRegular,
                  ),
                  Gap(36),
                  Column(
                    children: [
                      const EmailAndPassword(),
                      Gap(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      Gap(40),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return AppTextButton(
                            buttonText: state is Loading
                                ? "Logging in..."
                                : "Login",
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {
                              validateThenDoLogin(context);
                            },
                          );
                        },
                      ),
                      Gap(16),
                      const TermsAndConditionsText(),
                      Gap(60),
                      const DontHaveAccountText(),
                      const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
