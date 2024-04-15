import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/bloc/home_bloc.dart';
import 'package:vinnovate/app/presentation/login/bloc/login_bloc.dart';
import 'package:vinnovate/app/presentation/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 640),
      child: MaterialApp(
        title: 'Vinnovate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => HomeBloc())
        ], child: const LoginView()),
      ),
    );
  }
}
