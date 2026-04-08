import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_class_project/counter_state_controller.dart';
import 'package:live_class_project/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controller খুঁজে আনা (GetX থেকে)
  CounterStateController counterStateController =
  Get.find<CounterStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"), // AppBar title
      ),

      body: Center(
        // UI update হবে যখন controller update() call করবে
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterStateController>(
              builder: (controller) {
                return Text(
                  controller.count.toString(), // count show
                  style: const TextStyle(fontSize: 24
                  ),
                );
              },),
            ElevatedButton(onPressed: (){

              Get.to(const SecondScreen());
              //GetX ei babey raute manage korey . When it's rapped into :GetMaterialApp : (counter_app)
              ///.to নতুন screen এ যায়, কিন্তু আগের screen keep থাকে (back করা যায়)

            },
                child: Text('Go to second screen')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterStateController.updateValue(3); // value +3 করা
        },
        child: const Icon(Icons.add), // button icon
      ),
    );
  }
}
