import 'dart:math' as math;
import 'package:assignment/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Weight extends StatelessWidget {
  Weight({super.key});

  final Backend backend = Get.put(Backend());

  
  final FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 8);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        minimum: const EdgeInsets.all(33),
        child: Column(
          children: [
            const Text(
              "What's your weight",
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


            Obx(
              () => Container(
                height: 60,
                width: Get.width * 0.7,
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
                    InkWell(
                      onTap: () => backend.toggleWeightUnit("Kg"),
                      child: Container(
                        height: 60,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                          color: (backend.weightUnit.value == "Kg")
                              ? const Color(0xff522ed2)
                              : const Color(
                                  0xfff1f4f8), // Set active/inactive color
                          borderRadius: BorderRadius.horizontal(
                            left: const Radius.circular(33),
                            right: (backend.weightUnit.value == "Kg")
                                ? const Radius.circular(33)
                                : Radius.zero,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Kg",
                            style: TextStyle(
                              color: (backend.weightUnit.value == "Kg")
                                  ? Colors.white
                                  : Colors.grey, // Set text color
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => backend.toggleWeightUnit("LBS"),
                      child: Container(
                        height: 60,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                          color: (backend.weightUnit.value == "LBS")
                              ? const Color(0xff522ed2)
                              : const Color(
                                  0xfff1f4f8), // Set active/inactive color
                          borderRadius: BorderRadius.horizontal(
                            right: const Radius.circular(33),
                            left: (backend.weightUnit.value == "LBS")
                                ? const Radius.circular(33)
                                : Radius.zero,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "LBS",
                            style: TextStyle(
                              color: (backend.weightUnit.value == "LBS")
                                  ? Colors.white
                                  : Colors.grey, // Set text color
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: Get.height * 0.1),            
            
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                            backend.toggleWeighht(index + 80);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              final weightValue = 80 + index;
                              return Obx(
                                () => Center(
                                  child: Text(
                                    '$weightValue',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: weightValue == backend.weight.value
                                          ? const Color(0xff522ed2)
                                          : Colors.grey,
                                      fontWeight:
                                          weightValue == backend.weight.value
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

                  Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${backend.weight.value}",
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff522ed2),
                          ),
                        ),
                        Text(
                          " ${backend.weightUnit.value}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff522ed2),
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          

            SizedBox(height: Get.height * 0.02),

            // Display Selected Weight
            
          ],
        ),
      ),
    );
  }
}
