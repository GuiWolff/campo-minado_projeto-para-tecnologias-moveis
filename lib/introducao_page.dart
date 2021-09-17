
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/introducao_page_controller.dart';
import 'package:trabalho1/widgets/botao.dart';
import 'package:trabalho1/widgets/drawer.dart';

import 'pages/gameplay/gameplay_page.dart';

class IntroducaoPage extends GetView<IntroducaoPageController> {
  const IntroducaoPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(IntroducaoPageController());
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xff90cfe9),
            ),
            drawer: CustomDrawer(),
            body: Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    "assets/intro/bg.png",
                    width: 800,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Center(
                  child: Image.asset("assets/intro/campominado.png"),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonApp("Começar o jogo", fontSize: 12.sp, onPressed:  ()=> Get.to(GamePlayPage()), color: const Color(0xff90cfe9), ),
                      SizedBox(height: 12.h,)
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
