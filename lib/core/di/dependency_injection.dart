import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/auth/data/repos/login_repo.dart';
import 'package:docdoc/features/auth/data/repos/signup_repo.dart';
import 'package:docdoc/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/manager/signup/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Register Dio And ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // Signup
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
}
