//ei code e by default Dependency manager siklam
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_class_project/counter_state_controller.dart';
import 'package:live_class_project/home_screen.dart';
import 'package:live_class_project/main.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:  HomeScreen(), // প্রথম screen
      initialBinding: GetxDependencyBinder(), // binding attach
    );
  }
}

///hw learn: todo - Code against abstraction -> Dependency injection -> Dependency inversion

// Dependency injection (controller bind করা)
class GetxDependencyBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterStateController()); // Controller memory তে রাখা
  }
}