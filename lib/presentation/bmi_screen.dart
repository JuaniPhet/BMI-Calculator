import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String gender = "male";
  bool isMale = true;
  String unit = "Cm";
  double heightValue = 160;
  double weightValue = 10;
  double ageValue = 21;

  double cmToIn(double Cm) {
    return Cm * 0.393701;
  }

  double cmToFt(double Cm) {
    return Cm * 0.0328084;
  }

  double InToCm(double In) {
    return In / 0.393701;
  }

  double InToFt(double In) {
    return In / 12;
  }

  double FtToCm(double Ft) {
    return Ft / 0.0328084;
  }

  double FtToIn(double Ft) {
    return Ft * 12;
  }

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
            Expanded(
              child: Row(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.deepPurple,
                              size: 45,
                            ),
                            Gap(20),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.deepPurple,
                              size: 45,
                            ),
                            Gap(20),
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
                                      if (unit == "Cm") {
                                        heightValue =
                                            cmToIn(heightValue).floorToDouble();
                                      } else if (unit == "Ft") {
                                        heightValue =
                                            FtToIn(heightValue).floorToDouble();
                                      }
                                      unit = "In";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "In"
                                          ? Colors.deepPurple.withOpacity(0.5)
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
                                      if (unit == "In") {
                                        heightValue = InToFt(heightValue)
                                            .ceilToDouble(); // convert in to ft
                                      } else if (unit == "Cm") {
                                        heightValue = cmToFt(heightValue)
                                            .floorToDouble(); // convert cm to ft
                                      }
                                      unit = "Ft";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "Ft"
                                          ? Colors.deepPurple.withOpacity(0.5)
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
                                      if (unit == "In") {
                                        heightValue = InToCm(heightValue)
                                            .ceilToDouble(); // convert in to ft
                                      } else if (unit == "Ft") {
                                        heightValue = FtToCm(heightValue)
                                            .ceilToDouble(); // convert cm to ft
                                      }
                                      unit = "Cm";
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: unit == "Cm"
                                          ? Colors.deepPurple.withOpacity(0.5)
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
                    Spacer(),
                    Text(
                      "${heightValue.round()}",
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    Slider(
                      value: heightValue,
                      min: unit == "Cm"
                          ? 31
                          : unit == "Ft"
                              ? 1 //cmToFt(25).floorToDouble()
                              : 12, //cmToIn(25).floorToDouble(),
                      max: unit == "Cm"
                          ? 275
                          : unit == "Ft"
                              ? cmToFt(275).floorToDouble()
                              : cmToIn(275).floorToDouble(),
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
            ),
            Gap(8),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      weightValue--;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.deepPurple.withOpacity(0.5)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Icon(
                                        Icons.remove,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  "${weightValue.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Gap(8),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      weightValue++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.deepPurple.withOpacity(0.5)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(10),
                          const Text(
                            "Kg",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ageValue--;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.deepPurple.withOpacity(0.5)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Icon(
                                        Icons.remove,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(8),
                                Text(
                                  "${ageValue.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Gap(8),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ageValue++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Colors.deepPurple.withOpacity(0.5)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(10),
                          const Text(
                            "Year",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
              ),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
