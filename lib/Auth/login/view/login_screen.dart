import 'package:decor_home/Auth/register/registration_screen.dart';
import 'package:decor_home/helper/animations/animation_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:decor_home/helper/widgets/customtextfield.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:decor_home/view/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login_view';
  const LoginScreen({super.key});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar('Error', 'Could not launch $url',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(0.25));
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          SizedBox(
            height: Get.height * .07,
          ),
          const Center(
            child: Text(
              'Homebody Haven',
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
            controller: emailController,
            heading: 'Email',
            title: 'enter your email',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {}, child: const Text('Forget password')),
              TextButton(
                  onPressed: () {
                    Get.toNamed(RegistrationForm.route);
                  },
                  child: const Text('Register yourself')),
            ],
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Login with your',
                  style: h3Style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchURL('https://accounts.google.com/signin');
                      },
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL('https://www.facebook.com/login');
                      },
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL('https://twitter.com/login');
                      },
                      icon: const Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * .2,
          ),
          GestureDetector(
            onTap: () {
              final email = emailController.text.trim();
              final password = passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                Get.snackbar(
                    'Attention!', 'Please fill in all fields correctly.',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red.withOpacity(0.25));
              } else {
                Future.delayed(const Duration(seconds: 1)).then(
                  (_) => navigateWithDelay(context, HomeScreen.route),
                );
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
                  'Login',
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
