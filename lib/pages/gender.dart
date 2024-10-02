import 'package:assignment/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gender extends StatelessWidget {
  Gender({super.key});

  final Backend backend = Get.put(Backend());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        minimum: const EdgeInsets.all(33),
        child: Column(
          children: [
            const Text(
              "Select your Gender",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Help us to create your personalized plan",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            SizedBox(
              width: Get.width * 0.8,
              height: Get.height * 0.25,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: backend.sex.value,
                          onChanged: (value) {
                            backend.toggleSex(value);
                          },
                        ),
                        Expanded(
                          child: Image.asset("assets/girl.png"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Radio<int>(
                          value: 2,
                          groupValue: backend.sex.value,
                          onChanged: (value) {
                            backend.toggleSex(value);
                          },
                        ),
                        Flexible(
                          child: Image.asset("assets/men.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                backend.toggleSex(3);
              },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all<double>(4),
                side: WidgetStateProperty.all<BorderSide>(
                  const BorderSide(
                      color: Colors.black12,
                      width: 2), // Set the border color and width here
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Other  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Obx(
              () => Container(
                height: 60,
                width: Get.width * 0.75,
                decoration: const BoxDecoration(
                  color: Color(0xfff1f4f8), // Set active/inactive color
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(33),
                    right: Radius.circular(33),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        color: (backend.sex.value == 1)
                            ? const Color(0xff522ed2)
                            : const Color(
                                0xfff1f4f8), // Set active/inactive color
                        borderRadius: BorderRadius.horizontal(
                          left: const Radius.circular(33),
                          right: (backend.sex.value == 1)
                              ? const Radius.circular(33)
                              : Radius.zero,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                            color: (backend.sex.value == 1)
                                ? Colors.white
                                : Colors.grey, // Set text color
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        color: (backend.sex.value == 2)
                            ? const Color(0xff522ed2)
                            : const Color(
                                0xfff1f4f8), // Set active/inactive color
                        borderRadius: BorderRadius.horizontal(
                          left: (backend.sex.value == 2)
                              ? const Radius.circular(33)
                              : Radius.zero,
                          right: (backend.sex.value == 2)
                              ? const Radius.circular(33)
                              : Radius.zero,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Mail",
                          style: TextStyle(
                            color: (backend.sex.value == 2)
                                ? Colors.white
                                : Colors.grey, // Set text color
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        color: (backend.sex.value == 3)
                            ? const Color(0xff522ed2)
                            : const Color(
                                0xfff1f4f8), // Set active/inactive color
                        borderRadius: BorderRadius.horizontal(
                          right: const Radius.circular(33),
                          left: (backend.sex.value == 3)
                              ? const Radius.circular(33)
                              : Radius.zero,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Other",
                          style: TextStyle(
                            color: (backend.sex.value == 3)
                                ? Colors.white
                                : Colors.grey, // Set text color
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
