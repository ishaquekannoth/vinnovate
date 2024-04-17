import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/bloc/home_bloc.dart';
import 'package:vinnovate/app/presentation/home_view/home_view.dart';
import 'package:vinnovate/app/presentation/login/widgets/custom_form_field.dart';
import 'package:vinnovate/app/presentation/login/widgets/custom_tag_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              surfaceTintColor: Colors.white,
              elevation: 0.2.h,
              color: Colors.white,
              child: SizedBox(
                height: 280.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomTagText(
                      text: "Email",
                    ),
                    CustomFormFieldWithValidation(
                      type: FieldType.eMail,
                      hintText: "Email",
                      preFixIcon: const Icon(Icons.email_outlined),
                      autovalidateMode: AutovalidateMode.always,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTagText(
                      text: "Password",
                    ),
                    CustomFormFieldWithValidation(
                      preFixIcon: const Icon(Icons.lock),
                      type: FieldType.password,
                      hintText: "Password",
                      autovalidateMode: AutovalidateMode.always,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTagText(
                      textAlign: TextAlign.right,
                      text: "Forget Password?",
                      onTap: () {
                        log("Perform Action on forgot password");
                      },
                    ),
                    SizedBox(
                      width: 270.w,
                      height: 40.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 243, 103, 103)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.r)))),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (_) =>
                                          HomeBloc()..add(LoadProducts()),
                                      child: const HomeView(),
                                    )));
                          },
                          child: Text(
                            "Log in",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.h),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTagText(
                  width: 150.w,
                  textAlign: TextAlign.center,
                  text: "Do not have an account ?",
                ),
                CustomTagText(
                  width: 50.w,
                  textAlign: TextAlign.center,
                  text: "Sign up",
                  onTap: () {
                    log("Perform Action on Sign up");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
