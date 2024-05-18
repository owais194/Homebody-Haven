import 'package:decor_home/Auth/login/view/login_screen.dart';
import 'package:decor_home/Auth/register/registration_screen.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:decor_home/view/screens/ham%20sections/about_us.dart';
import 'package:decor_home/view/screens/ham%20sections/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile-screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: Get.height * .1,
          ),
          SizedBox(
            height: Get.height * .2,
            width: double.infinity,
            child: const CircleAvatar(
              radius: 70,
              child: Icon(
                FontAwesomeIcons.user,
                size: 60,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: Get.height * .1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed(LoginScreen.route);
                  },
                  child: const Text(
                    'Login',
                    style: h3Style,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(RegistrationForm.route);
                    },
                    child: const Text(
                      'Register',
                      style: h3Style,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Get.toNamed(AboutUsPage.route);
                },
                child: const ListTile(
                  leading: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'About us',
                    style: h3Style,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: .1,
              color: Colors.black,
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Get.toNamed(ContactUsPage.route);
                },
                child: const ListTile(
                  leading: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Contact us',
                    style: h3Style,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: .1,
              color: Colors.black,
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Account settings',
                    style: h3Style,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: .1,
              color: Colors.black,
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(
                    FontAwesomeIcons.building,
                    color: Colors.purple,
                  ),
                  title: Text(
                    'Coperation',
                    style: h3Style,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
