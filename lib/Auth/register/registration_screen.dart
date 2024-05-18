import 'package:decor_home/helper/animations/animation_func.dart';
import 'package:decor_home/helper/animations/registration%20animation/animation_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:decor_home/helper/widgets/customtextfield.dart';
import 'package:decor_home/Auth/login/view/login_screen.dart';

class RegistrationForm extends StatelessWidget {
  static const String route = 'registration_form';
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          SizedBox(
            height: Get.height * .02,
          ),
          const Center(
            child: Text(
              'Signup',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .13,
          ),
          CustomTextField(
            controller: nameController,
            heading: 'Name',
            title: 'jhonson',
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          CustomTextField(
            controller: numberController,
            heading: 'Mobile number',
            title: '+92-xxx-xxxxxxx',
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          CustomTextField(
            controller: emailController,
            heading: 'Email',
            title: 'johnson@xyz.com',
            icon: Icon(Icons.mail),
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          CustomTextField(
            controller: passwordController,
            heading: 'Password',
            title: 'enter your password',
            icon: Icon(Icons.lock),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {}, child: const Text('Forget password')),
            ],
          ),
          SizedBox(
            height: Get.height * .1,
          ),
          GestureDetector(
            onTap: () {
              final email = emailController.text.trim();
              final password = passwordController.text.trim();
              final name = nameController.text.trim();
              final epassword = passwordController.text.trim();

              if (email.isEmpty ||
                  password.isEmpty ||
                  name.isEmpty ||
                  epassword.isEmpty) {
                Get.snackbar('Attention!', 'Please fill in all fields',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red.withOpacity(0.25));
              } else {
                Get.snackbar(
                  'Success!',
                  'Registration successful!',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green.withOpacity(0.25),
                );
                Future.delayed(const Duration(seconds: 1))
                    .then((_) => registerWithDelay(context, LoginScreen.route));
              }
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.green],
                ),
              ),
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
