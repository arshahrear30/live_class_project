import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_class_project/home_screen.dart';
import 'package:live_class_project/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Second screen'),
      ),

      body: Center(
        child: Column(
          children: [

            ElevatedButton(
              onPressed: () {
                Get.off(ThirdScreen());
                ///.off আগের screen remove করে নতুন screen এ যায়
              },
              child: const Text('Go to third screen'),
            ),

            ElevatedButton(
              onPressed: () {
                Get.offAll(HomeScreen());
                //Sob gula screen key remove korey offAll eta.. ekon ar backbuttol dileo asbey na kicu .
                ///.offAllসব previous screen remove করে নতুন screen (fresh start)
                //.to নতুন screen এ যায়, কিন্তু আগের screen keep থাকে (back করা যায়)
                //.off আগের screen remove করে নতুন screen এ যায়
              },
              child: const Text('Go to home'),
            ),


            ElevatedButton(
              onPressed: () {
                // previous screen এ ফিরে যাবে + data পাঠাবে
                Get.back(result: 'shahrear');
              },
              child: const Text('Back'),
            ),

          ],
        ),
      ),

    );
  }
}
