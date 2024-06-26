import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    hintText: 'Enter your mail',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    prefixIcon: const Icon(Icons.mail)),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: GestureDetector(
                      child: const Icon(Icons.remove_red_eye),
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Dont have account?',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        textStyle: TextStyle(fontSize: 15.sp)),
                    onPressed: () {
                      authController.userSignIn(
                          emailController.text, passwordController.text);
                    },
                    child: const Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
