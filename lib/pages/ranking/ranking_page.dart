import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/introducao_page.dart';
import 'package:trabalho1/pages/ranking/ranking_page_controller.dart';
import 'package:trabalho1/repository/ranking/ranking_singleton.dart';
import 'package:trabalho1/widgets/textos.dart';

class RankingPage extends GetView<RankingPageController> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(RankingPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.home),
          onPressed: ()=> Get.to(IntroducaoPage())),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: [
              Color(0xff90cfe9),
              Color(0xffffffff)
            ],
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Align(alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 90.w),
                child: Obx(
                    ()=> ListView.builder(
                      itemCount: RankingSingleton.instance.ranking.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: i.isEven
                                    ? const Color(0xff2eb0e6)
                                    : const Color(0xff90cfe9),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                        TextBody(RankingSingleton.instance.ranking[RankingSingleton.instance.ranking.length - i - 1].nomeDoJogador.toUpperCase(), color: Color(0xffffffff), fontSize: 14.sp,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextBody("Pontuação: ${RankingSingleton.instance.ranking[RankingSingleton.instance.ranking.length - i - 1].pontuacao} - ", color: Color(0xffffffff), fontSize: 14.sp,),
                                      TextBody("Nível alcançado: ${RankingSingleton.instance.ranking[RankingSingleton.instance.ranking.length - i - 1].nivelAlcancado}", color: Color(0xffffffff), fontSize: 14.sp,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextBody("Data: ${controller.datetimeToString(RankingSingleton.instance.ranking[RankingSingleton.instance.ranking.length - i - 1].dataDoJogo)}", color: Color(0xffffffff), fontSize: 14.sp,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,)
                          ],
                        );
                      }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
