import 'package:decor_home/Auth/login/view/login_screen.dart';
import 'package:decor_home/Auth/register/registration_screen.dart';
import 'package:decor_home/view/screens/ham%20sections/about_us.dart';
import 'package:decor_home/view/screens/ham%20sections/contact_us.dart';
import 'package:decor_home/view/screens/home_screen.dart';
import 'package:decor_home/view/screens/profile_screen.dart';
import 'package:decor_home/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  final Map<String, Widget Function(BuildContext)> routes = {
    WellcomeScreen.route: (p0) => const WellcomeScreen(),
    LoginScreen.route: (p0) => LoginScreen(),
    HomeScreen.route: (p0) => HomeScreen(),
    RegistrationForm.route: (p0) => RegistrationForm(),
    ContactUsPage.route: (p0) => const ContactUsPage(),
    AboutUsPage.route: (p0) => const AboutUsPage(),
    ProfileScreen.route: (p0) => const ProfileScreen(),
  };
}
