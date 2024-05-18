import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:decor_home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  static const String route = 'Wellcome_screen';
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wellcomescreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Homebody\nHaven",
                  style: h1Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 105),
                Text(
                  "Discover the perfect pieces for your space",
                  style: h2Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                          const EdgeInsets.all(12),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.grey.withOpacity(0.4)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Get started",
                        style: h3Style.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
