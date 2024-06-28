import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/controller/auth/auth_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final authController = Get.find<AuthController>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    hintText: 'Enter your Name',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    prefixIcon: const Icon(Icons.abc)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value)) {
                    return 'Enter a valid email address';
                  } else {
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'password should atleast 8 characher long';
                  } else {
                    return null;
                  }
                },
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
                      'Have account?',
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
                child: Obx(
                  () => TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: authController.isLoading.value
                              ? Colors.grey
                              : Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          textStyle: TextStyle(fontSize: 15.sp)),
                      onPressed: authController.isLoading.value
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                authController.userSignUP(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                              }
                            },
                      child: authController.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text('Sign up')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
