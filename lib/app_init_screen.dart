import 'package:flutter/material.dart';
import 'package:flutter_fourth/presentation/bmi_screen.dart';
import 'package:gap/gap.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  goToNextScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BmiScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.timelapse,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const Gap(10),
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.deepPurple,
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
