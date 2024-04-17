import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/bloc/home_bloc.dart';
import 'package:vinnovate/app/presentation/login/bloc/login_bloc.dart';
import 'package:vinnovate/app/presentation/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB05F027knj7pBfF9ioDHdKD61u7sYWQa0",
        appId: "1:540076455640:android:e27cbcb191c08e324d89ad",
        messagingSenderId: "540076455640",
        projectId: "vinnovate-67c24"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 640),
      child: MultiBlocProvider(
        providers:  [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => HomeBloc()..add(LoadProducts()))
        ],
        child: MaterialApp(
          title: 'Vinnovate',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginView(),
        ),
      ),
    );
  }
}
