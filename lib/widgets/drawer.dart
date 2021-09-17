
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/pages/cadastro_jogador/cadastro_jogador_page.dart';
import 'package:trabalho1/pages/ranking/ranking_page.dart';
import 'package:trabalho1/widgets/textos.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {

CustomDrawer({Key? key, }): super(key: key);

abrirUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                child: Column(
                children: [
                  Image.asset("assets/drawer/explosao.png"),
                  SizedBox(height: 2.h,),
                  TextBody("Guilherme Wolff - Eng. Controle e Automação", color: Colors.white, fontSize: 10.sp, alignment: TextAlign.left, larguraMaxima: 70.w,),
                  TextBody("Trabalho 1 - Projetos para Técnologias Móveis", color: Colors.white, fontSize: 10.sp, alignment: TextAlign.left, larguraMaxima: 70.w,),
                  SizedBox(height: 1.h,),
                ],
              ),
              color: Colors.blueGrey,
              ),
            ),
            GestureDetector(
              onTap: ()=> abrirUrl("https://pt.wikipedia.org/wiki/Campo_minado"),
              child: ListTile(
                title: TextBody("Sobre o Jogo", color: Colors.white, fontSize: 14.sp,),
                leading: const Icon(Icons.videogame_asset, size: 30,),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(RankingPage()),
              child: ListTile(
                title: TextBody("Ranking", color: Colors.white, fontSize: 14.sp,),
                leading: const Icon(Icons.assessment, size: 30,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
