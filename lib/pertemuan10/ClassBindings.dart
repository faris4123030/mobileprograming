import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class ControllerA extends GetxController {
  var valueA = 'A'.obs;
}

class ControllerB extends GetxController {
  var valueB = 'B'.obs;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: BindingsBuilder(
                () {
              Get.put(ControllerA());
              Get.put(ControllerB());
            },
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Class Bindings dengan GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Value A: ${Get.find<ControllerA>().valueA}")),
            Obx(() => Text("Value B: ${Get.find<ControllerB>().valueB}")),
          ],
        ),
      ),
    );
  }
}