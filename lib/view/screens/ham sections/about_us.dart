import 'package:decor_home/view/screens/home_screen.dart';
import 'package:decor_home/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUsPage extends StatelessWidget {
  static const String route = 'about-us';
  final String phoneNumber = "+923083113151"; // WhatsApp number

  // WhatsApp number

  void _launchWhatsApp(BuildContext context) async {
    String url = "https://wa.me/$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(HomeScreen.route);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          SizedBox(
            height: Get.height * .1,
          ),
          const Center(
            child: Text(
              'About Us',
              style: TextStyle(fontSize: 55, color: Colors.black),
            ),
          ),
          SizedBox(
            height: Get.height * .07,
          ),
          const SizedBox(
            child: Text(
              'Sindh Online School has started with the help of a small \nteam of volunteers during the Covid-19 lockdown. \nIn spite of limited resources, lock down restrictions; the \nvolunteers worked around the clock, and we not only succeeded \nin launching the first Sindhi e-learning website but \nalso created the contents and posted on the website. \nTo implement this pilot project to fully developed and functional entity, \nwe need not only additional team members but also learning \nresources, software & hardware tools, Science laboratory materials, \nWeb & App development support & outsourcing of animated contents, \netc. We have taken the initiative, have seeded the soil, which \nultimately will grow and bear its fruit for the better \nfuture of Sindh. We appeal the well-wishers and friends \nof Sindh to please come forward and take ownership of ',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          GestureDetector(
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'owaismustafa2000@gmail.com',
              );

              final String urlString = emailUri.toString();

              await launchUrlString(urlString);
            },
            child: SizedBox(
              width: Get.width,
              child: const Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'owaismustafa2000@gmail.com',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _launchWhatsApp(context),
        child: Icon(FontAwesomeIcons.whatsapp),
      ),
    );
  }
}
