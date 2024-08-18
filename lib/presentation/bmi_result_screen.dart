import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../business_logic/bmi_advice/bmi_advice_bloc.dart';
// import 'package:flutter_fourth/data/models/gender_model.dart';

import '../data/models/bmi_model.dart';

class BmiResultScreen extends StatefulWidget {
  final BmiModel bmi;
  final String name;
  final String gender;
  // final GenderModel myGenderModel;
  // final BmiScreen myBmiScreen;

  BmiResultScreen({
    super.key,
    required this.bmi,
    required this.name,
    required this.gender,
  });

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  late BmiAdviceBloc adviceBloc;

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    adviceBloc = BmiAdviceBloc()
      ..add(
        FetchBmiAdviceEvent(
          username: widget.name,
          genre: widget.gender,
          imc: widget.bmi.imc,
          weight: widget.bmi.heigthInMeter,
          age: 22,
        ),
      );
    super.initState();
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
        title: const Row(
          children: [
            Expanded(
              child: Text(
                "BMI Calculator",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.settings,
            size: 30,
          ),
          Gap(8),
        ],
      ),
      body: BlocBuilder<BmiAdviceBloc, BmiAdviceState>(
        bloc: adviceBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: ListView(
              children: [
                const Text(
                  "Result",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Your BMI is",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.bmi.status.status,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: widget.bmi.imc < 18.5
                                    ? Colors.orange
                                    : widget.bmi.imc >= 18.5 &&
                                            widget.bmi.imc <= 24.9
                                        ? Colors.deepPurple.withOpacity(0.6)
                                        : const Color.fromARGB(255, 236, 16, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      Text(
                        widget.bmi.imc.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // const Spacer(),
                      // Slider(
                      //   value: 0.5,
                      //   // min: unit == "Cm"
                      //   //     ? 31
                      //   //     : unit == "Ft"
                      //   //         ? 1 //cmToFt(25).floorToDouble()
                      //   //         : 12, //cmToIn(25).floorToDouble(),
                      //   // max: unit == "Cm"
                      //   //     ? 275
                      //   //     : unit == "Ft"
                      //   //         ? cmToFt(275).floorToDouble()
                      //   //         : cmToIn(275).floorToDouble(),
                      //   activeColor: Colors.deepPurple,
                      //   inactiveColor: Colors.grey,
                      //   onChanged: (double value) {
                      //     setState(() {
                      //       // heightValue = value;
                      //     });
                      //   },
                      // ),
                      const Gap(20),
                    ],
                  ),
                ),
                const Gap(10),
                const Text(
                  "Advices",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Gap(10),
                Container(
                  child: state is FetchBmiAdviceLoading
                      ? Chip(
                          label: CircularProgressIndicator(
                            strokeWidth: 4,
                            strokeCap: StrokeCap.square,
                            color: Colors.deepPurple.withOpacity(0.5),
                            backgroundColor: Colors.grey.withOpacity(0.3),
                          ),
                        )
                      : state is FetchBmiAdviceSuccess
                          ? MarkdownBody(
                              data: '''${state.response.text}''',
                              onTapLink: (text, href, title) {
                                _launchURL(href!);
                              },
                              styleSheet: MarkdownStyleSheet(
                                a: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.deepPurple,
                                ),
                                p: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : state is FetchBmiAdviceFailure
                              ? Text(
                                  state.message,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                  ),
                                )
                              : Text(widget.bmi.status.advice),
                ),
                const Gap(10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text(
                    "Re-Calculate",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 10,
                      )),
                ),
                const Gap(10),
              ],
            ),
          );
          // }
          // return Container();
        },
      ),
    );
  }
}
