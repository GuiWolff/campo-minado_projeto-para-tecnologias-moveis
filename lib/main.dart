import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trabalho1/introducao_page.dart';

void main() async {
  await GetStorage.init('ranking');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

MyApp({Key? key, }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroducaoPage(),
    );
  }
}

