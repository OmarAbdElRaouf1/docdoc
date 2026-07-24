import 'package:docdoc/core/helpers/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theme/styles.dart';
import 'package:docdoc/features/auth/presentation/manager/auth/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/manager/auth/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }

            context.pushAndRemoveUntil(Routes.homeScreen);
          },
          failure: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
