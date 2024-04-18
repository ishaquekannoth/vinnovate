import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/home_view.dart';
import 'package:vinnovate/app/presentation/login/bloc/login_bloc.dart';
import 'package:vinnovate/app/presentation/login/widgets/custom_form_field.dart';
import 'package:vinnovate/app/presentation/login/widgets/custom_tag_text.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginView({super.key});

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
                      controller: emailController,
                      type: FieldType.eMail,
                      hintText: "Email",
                      preFixIcon: const Icon(Icons.email_outlined),
                      autovalidateMode: AutovalidateMode.always,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(OnEmailChange(email: value));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTagText(
                      text: "Password",
                    ),
                    CustomFormFieldWithValidation(
                      controller: passwordController,
                      preFixIcon: const Icon(Icons.lock),
                      type: FieldType.password,
                      hintText: "Password",
                      autovalidateMode: AutovalidateMode.always,
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(OnPasswordChange(password: value));
                      },
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
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) async {
                          if (state is LoginSuccess) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeView()),
                                (route) => false);
                          }
                          if (state is LoginFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              state.message,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            )));
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: state.isEmailValid &&
                                          state.isPasswordValid
                                      ? const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 243, 103, 103))
                                      : const MaterialStatePropertyAll(
                                          Colors.grey),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.r)))),
                              onPressed:
                                  state.isEmailValid && state.isPasswordValid
                                      ? () async {
                                          context.read<LoginBloc>().add(
                                              OnLoginButtonPress(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text));
                                        }
                                      : null,
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.h),
                              ));
                        },
                      ),
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
