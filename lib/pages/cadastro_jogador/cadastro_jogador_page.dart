

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/pages/cadastro_jogador/cadastro_jogador_page_controller.dart';
import 'package:trabalho1/pages/ranking/ranking_page.dart';
import 'package:trabalho1/widgets/app_textformfield.dart';
import 'package:trabalho1/widgets/botao.dart';

class CadastroJogadorPage extends GetView<CadastroJogadorPageController> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(CadastroJogadorPageController());
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9,],
              colors: [
                Color(0xff90cfe9),
                Color(0xffffffff),
              ],
            ),
          ),

          child: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 12.h),
                        child: Image.asset("assets/ranking/trofeu2.png", scale: 1.5,)),
                    AppTextFormField(
                      "Insira seu nome",
                      minWidth: Get.mediaQuery.size.width * .9,
                      maxWidth: Get.mediaQuery.size.width * .9,
                      controller: controller.textControllerNome,
                      validator: (v) => controller.validarNome(v),
                    ),
                    SizedBox(height: 5.h, width: 100.w,),
                    ButtonApp("Salvar jogador", fontSize: 12.sp, onPressed:  () {
                      if (controller.formKey.currentState!.validate()) {
                        Get.offAll(RankingPage());
                      }
                    }, color: const Color(0xff90cfe9),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}


