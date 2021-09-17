import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:trabalho1/pages/cadastro_jogador/cadastro_jogador_page.dart';
import 'package:trabalho1/repository/ranking/ranking_singleton.dart';

class GamePlayPageController extends GetxController {
  GamePlayPageController() {
    inicializarListaDeBotoesClicados();
    buscarCenariosAleatorios();
    buscarPosicoesMinadas();
    inicializarVidas();
  }

  final int ordemDaMatrix = 6;
  RxInt nivelDeDificuldade = 1.obs;
  int quantidadeDeBombas = 4;
  RxInt quantidadeDeVidas = 3.obs;
  RxList listaDeVidas = [].obs;
  RxList listaDeBotoesClicados = [].obs;
  List<int> posicaoDasMinasTerrestres = [].cast<int>();
  List<int> spriteDoCampoDeBatalha = [].cast<int>();
  RxInt score = 0.obs;
  RxBool gameWins = false.obs;
  RxBool onExplosionBomb = false.obs;
  RxBool onLvlUp = false.obs;

  void inicializarListaDeBotoesClicados(){
    for(int i = 0; i < ordemDaMatrix * ordemDaMatrix; i++){
      listaDeBotoesClicados.add(true);
    }
  }

  void buscarPosicoesMinadas() {
    posicaoDasMinasTerrestres.clear();
    bool istrue = true;
    while(istrue){
      int posicaoDaBomba = Random().nextInt(ordemDaMatrix * ordemDaMatrix);
      if(!posicaoDasMinasTerrestres.contains(posicaoDaBomba)){
        posicaoDasMinasTerrestres.add(posicaoDaBomba);
      }
      if(posicaoDasMinasTerrestres.length == quantidadeDeBombas){
        istrue = false;
      }
    }
  }

  void inicializarVidas(){
    for(int i = 0; i < quantidadeDeVidas.value; i++){
      listaDeVidas.add("heart.png");
    }
  }

  void buscarCenariosAleatorios(){
    for (int i = 0; i < 4; i++) {
      spriteDoCampoDeBatalha.add(funcSpriteCamnpoDeBatalhaRandomico());
    }
  }

  int funcSpriteCamnpoDeBatalhaRandomico(){
    bool istrue = true;
    int valorRandomico = 0;
    while (istrue) {
      valorRandomico = Random().nextInt(5) + 1;
      if (!spriteDoCampoDeBatalha.contains(valorRandomico)) {
        istrue = false;
      }
    }
    return valorRandomico;
  }

  void conferirPresencaDeBomba(int posicaoDoTabuleiro){
    if(posicaoDasMinasTerrestres.contains(posicaoDoTabuleiro)){
      print("exprudiuuu");
      quantidadeDeVidas--;

      if(quantidadeDeVidas < 1){
        print("GameOver");
        onGameOver();
      }
      onExplosion();
    } else {
      score.value++;
      RankingSingleton.instance.pontuacao = score.value;
      if((ordemDaMatrix * ordemDaMatrix) - quantidadeDeBombas == verificarQuantidadeDeBotoesClicados() && nivelDeDificuldade.value < 4){
            quantidadeDeBombas *= 2;
            posicaoDasMinasTerrestres.clear();
            buscarPosicoesMinadas();
            listaDeBotoesClicados.clear();
            inicializarListaDeBotoesClicados();
            if(nivelDeDificuldade.value < 4){
              onLevelUp();
            }
          nivelDeDificuldade.value++;
          RankingSingleton.instance.nivelAlcancado = nivelDeDificuldade.value;
      }
      if((ordemDaMatrix * ordemDaMatrix) - quantidadeDeBombas == verificarQuantidadeDeBotoesClicados() && nivelDeDificuldade.value == 4){
        gameWins.value = true;
        onGameWins();
        print("Fim do Jogo: nivelDeDificuldade: ${nivelDeDificuldade.value}");
      }
    }
  }

  int verificarQuantidadeDeBotoesClicados(){
    var qtd = 0;
    listaDeBotoesClicados.value.forEach((element) {
      if(!element){
        qtd++;
      }
    });
    return qtd;
  }

  void onGameOver(){
    playMusic("gameover");
    quantidadeDeBombas = 4;
    Future.delayed(const Duration(seconds: 2),
            () => Get.to(CadastroJogadorPage()));
  }

  void onGameWins(){
    quantidadeDeBombas = 4;
    playMusic("gamewins");
    Future.delayed(const Duration(seconds: 21),
            () => Get.to(CadastroJogadorPage()));
  }

  void playMusic(String musica){
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audio/$musica.mp3"),
      forceOpen: true,
      autoStart: true,
      showNotification: true,
    );
  }

  void onLevelUp(){
    playMusic("ehusguri");
    onLvlUp.value = true;
    Future.delayed(const Duration(seconds: 2),
            () {
      update();
      onLvlUp.value = false;
    });
  }

  void onExplosion(){
    playMusic("boom");
    onExplosionBomb.value = true;
    Future.delayed(const Duration(seconds: 5),
            () {
              onExplosionBomb.value = false;
              listaDeVidas[quantidadeDeVidas.value] = "heart_dead.png";
              posicaoDasMinasTerrestres.clear();
              buscarPosicoesMinadas();
              listaDeBotoesClicados.clear();
              inicializarListaDeBotoesClicados();
              update();
        });
  }
}
