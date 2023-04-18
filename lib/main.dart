import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/bloc_observer.dart';
import 'package:attendance_app/core/network/cache_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:attendance_app/feature/presntation/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  if (CacheHelper.getData(key: 'language') != null) {
    languageApp = CacheHelper.getData(key: 'language');
  }

  print(languageApp);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => SettingCubit()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 780),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const GetMaterialApp(
              title: 'Attendance',
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          }),
    );
  }
}
