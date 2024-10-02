import 'package:assignment/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Height extends StatelessWidget {
  Height({super.key});

  final Backend backend = Get.put(Backend());

  final FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 8);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 33),
        child: Column(
          children: [
            const Text(
              "What's your height?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Help us to create your personalized plan",
              style: TextStyle(
                fontSize: 14,
              ),
            ),

            SizedBox(
              height: Get.height * 0.05,
            ),

            Container(
              height: 60,
              width: Get.width * 0.5,
              decoration: BoxDecoration(
                  color: const Color(0xff522ed2), // Set active/inactive color
                  borderRadius: BorderRadius.circular(33)),
              child: const Center(
                child: Text(
                  "Cm",
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: Get.height * 0.05,
            // ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.4,
                    child: Image.asset("assets/body.png"),
                  ),
                  Row(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.keyboard_double_arrow_right,
                          color: Color(0xff522ed2),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.5,
                        width: 60,
                        child: ListWheelScrollView.useDelegate(
                          controller: controller,
                          itemExtent: 40,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            print(index);
                            backend.toggleHeight(index + 145);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final heightValue = 145 + index;
                              return Obx(
                                () => Center(
                                  child: Text(
                                    '$heightValue',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: heightValue == backend.height.value
                                          ? const Color(0xff522ed2)
                                          : Colors.grey,
                                      fontWeight:
                                          heightValue == backend.height.value
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: 55, // From 145 cm to 190 cm
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.4,
                        child: Image.asset("assets/scale.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
