import 'package:assignment/backend/backend.dart';
import 'package:assignment/pages/gender.dart';
import 'package:assignment/pages/height.dart';
import 'package:assignment/pages/weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PageController scrollController = PageController();
  final Backend backend = Get.put(Backend());

  void nextPage() {
    if (scrollController.page! < 2) {
      scrollController.nextPage(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
        actions: const [
          Text(
            "Skip  ",
            style: TextStyle(color: Color(0xff522ed2)),
          ),
        ],
      ),


      body: SafeArea(
        child: Column(
          children: [

            SmoothPageIndicator(
              controller: scrollController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotWidth: 40,
                dotHeight: 8,
                spacing: 5.0,
                activeDotColor: Color(0xff522ed2),
              ),
            ),

            SizedBox(
              height: Get.height * 0.75,
              child: PageView(
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Gender(),
                  Height(),
                  Weight(),
                ],
              ),
            ),

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(
                        value: backend
                            .progress.value, // Use reactive progress value
                        color: const Color(0xff522ed2),
                        backgroundColor: Colors.transparent,
                        strokeWidth: 5,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      backend.incrementLoader();
                      nextPage();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff522ed2),
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
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
