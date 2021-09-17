
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/pages/gameplay/gameplay_controller.dart';

class GamePlayPage extends GetView<GamePlayPageController> {


  @override
  Widget build(BuildContext context) {
    Get.put(GamePlayPageController());
    return Scaffold(
      body:  Stack(
        children: [
          Container(color: const Color(0xff90cfe9),
          width: 100.w,
          height: 100.h,
          child: Opacity(
              opacity: 0.3,
              child: Image.asset("assets/gameplay/bg0.png", repeat: ImageRepeat.repeat,)),),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  Container(
                    width: 30.w,
                    height: 10.w,
                    child: Obx(
                        ()=> ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listaDeVidas.length,
                        itemBuilder: (context, i){
                          return Image.asset("assets/gameplay/${controller.listaDeVidas[i]}", width: 6.w,);
                        }),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Obx(()=> Text("Score:${controller.score.value}", style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 12.sp))),
                  const SizedBox(height: 15,),
                  Obx(()=> Text("LVL:${controller.nivelDeDificuldade.value}", style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 12.sp)))
                ],
              ),
            ),
          ),
          Center(
            child: GetBuilder<GamePlayPageController>(
              init: GamePlayPageController(),
              builder: (s) => GridView.builder(
                itemCount: controller.ordemDaMatrix * controller.ordemDaMatrix,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int i) {
                  return Obx(
                    ()=> IgnorePointer(
                      ignoring: !controller.listaDeBotoesClicados[i],
                      child: GestureDetector(
                          onTap: ()=> {
                            controller.listaDeBotoesClicados[i] = false,
                            controller.conferirPresencaDeBomba(i)},
                          child: Stack(
                            children: [
                              Opacity(
                                  opacity:  controller.listaDeBotoesClicados[i] ? 1 : 0.65,
                                  child: Image.asset("assets/gameplay/bg${controller.spriteDoCampoDeBatalha[controller.nivelDeDificuldade.value-1]}.png")),
                              Visibility(
                                  visible: false, // para esconder bombas e tornar o jogo jogável
                                  // visible: controller.posicaoDasMinasTerrestres.contains(i), // Para visualizar bombas para fins de debug do código
                                  child: Image.asset("assets/gameplay/bomb.png")),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(
            ()=> Visibility(
              visible: controller.quantidadeDeVidas.value < 1,
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.7,
                      child: Container(color: Colors.white,)),
                  Center(child: Image.asset("assets/gameplay/youlose.png")),
                ],
              ),
            ),
          ),
          Obx(
                ()=> Visibility(
              visible: controller.gameWins.value,
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.7,
                      child: Container(color: Colors.white,)),
                  Center(child: Image.asset("assets/gameplay/youwin.png")),
                ],
              ),
            ),
          ),
          Obx(
                ()=> Visibility(
              visible: controller.onExplosionBomb.value,
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.7,
                      child: Container(color: Colors.white,)),
                  Center(child: Image.asset("assets/gameplay/boom.png")),
                ],
              ),
            ),
          ),
          Center(
            child: Obx(
                  ()=> Visibility(
                visible: controller.onLvlUp.value,
                child: Stack(
                  children: [
                    Opacity(
                        opacity: 0.7,
                        child: Container(color: Colors.white,)),
                    Center(child: Image.asset("assets/gameplay/lvlup.png", width: 50.w,)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
