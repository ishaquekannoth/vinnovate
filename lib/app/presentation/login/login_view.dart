import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/widgets/custom_form_field.dart';

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
            CustomFormFieldWithValidation(
              preFixIcon: const Icon(Icons.lock),
              type: FieldType.password,
              hintText: "Password",
              autovalidateMode: AutovalidateMode.always,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
            ),
          ],
        ),
      ),
    );
  }
}
