import 'package:decor_home/helper/widgets/customtextfield.dart';
import 'package:decor_home/view/screens/home_screen.dart';
import 'package:decor_home/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactUsPage extends StatelessWidget {
  static const String route = 'contact-us';
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: Get.height * .01,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(HomeScreen.route);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.height * .03,
          ),
          const Center(
            child: Text(
              'Contact US',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: Get.height * .1,
          ),

          CustomTextField(
            controller: nameController,
            heading: 'Name',
            title: 'enter your name',
          ),
          SizedBox(
            height: Get.height * .05,
          ),

          CustomTextField(
            controller: emailController,
            heading: 'enter your email',
            title: 'johnson@xyz.com',
            icon: const Icon(Icons.mail),
          ),

          SizedBox(
            height: Get.height * .03,
          ),
          Container(
            height: Get.height * .3,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                // Displayed label text
                hintText: 'enter your message here',
                hintMaxLines: 3,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .07,
          ),

          // Continue button

          GestureDetector(
            onTap: () {
              Get.snackbar(
                'Message sent succesfully',
                'Our team will respond you back shortly !',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green.withOpacity(0.25),
              );
              Future.delayed(const Duration(seconds: 2))
                  .then((_) => Get.toNamed(HomeScreen.route));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft, // Gradient starting point
                  end: Alignment.bottomRight, // Gradient ending point
                  colors: [Colors.blue, Colors.green], // Gradient colors
                ),
              ),
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
