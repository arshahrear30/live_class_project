import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_state_controller.dart';

void main() {
  runApp(const CounterApp()); // অ্যাপ শুরু
}

//ei code e by default Dependency manager siklam
///hw learn: todo - Code against abstraction -> Dependency injection -> Dependency inversion

// Dependency injection (controller bind করা)
class GetxDependencyBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterStateController()); // Controller memory তে রাখা
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(), // প্রথম screen
      initialBinding: GetxDependencyBinder(), // binding attach
    );
  }
}

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
        child: GetBuilder<CounterStateController>(
          builder: (controller) {
            return Text(
              controller.count.toString(), // count show
              style: const TextStyle(fontSize: 24),
            );
          },
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
