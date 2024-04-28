import 'package:bim_calculator/features/auth/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // login
  //getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
}
