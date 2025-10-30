import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String hasilResponse = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(hintText: "Masukkan nama"),
            ),
            TextField(
              controller: jobC,
              decoration: const InputDecoration(hintText: "Masukkan pekerjaan"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var response = await myHttp.post(
                  Uri.parse("https://reqres.in/api/users"),
                  body: {
                    "name": nameC.text,
                    "job": jobC.text,
                  },
                );

                Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;

                setState(() {
                  hasilResponse = "${data['name']} - ${data['job']}";
                });
              },
              child: const Text("KIRIM DATA"),
            ),
            const SizedBox(height: 20),
            Text(hasilResponse),
          ],
        ),
      ),
    );
  }
}