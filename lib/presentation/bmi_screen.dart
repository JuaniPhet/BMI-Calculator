import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String gender = "male";
  bool isMale = true;
  String unit = "In";
  double heightValue = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.timelapse,
          color: Colors.deepPurple,
          size: 40,
        ),
        title: const Expanded(
          child: Text(
            "BMI Calculator",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.settings,
            size: 30,
          ),
          Gap(8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        gender = "male";
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale
                            ? Colors.deepPurple.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.deepPurple,
                            size: 45,
                          ),
                          const Text(
                            "MALE",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        gender = "female";
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: !isMale
                            ? Colors.deepPurple.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.deepPurple,
                            size: 45,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Height",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      unit = "In";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "In"
                                          ? Colors.deepPurple.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text(
                                      "In",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      unit = "Ft";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "Ft"
                                          ? Colors.deepPurple.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text(
                                      "Ft",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      unit = "Cm";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "Cm"
                                          ? Colors.deepPurple.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text(
                                      "Cm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${heightValue.round().toString()}",
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Slider(
                      value: heightValue,
                      min: 25,
                      max: 275,
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.grey,
                      onChanged: (double value) {
                        setState(() {
                          heightValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
