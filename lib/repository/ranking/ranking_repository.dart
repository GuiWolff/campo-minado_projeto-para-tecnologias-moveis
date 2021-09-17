
import 'package:get_storage/get_storage.dart';
import 'package:trabalho1/model/ranking/ranking_model.dart';
import 'package:trabalho1/repository/ranking/ranking_singleton.dart';

class RankingRepository{

  RankingRepository(){
    buscarRankingNaMemoriaLocal();
  }

  final storage = GetStorage('ranking');
  final pathRanking = "/lista_de_jogadores";

  Future<void> buscarRankingNaMemoriaLocal() async {
    if(storage.read(pathRanking) != null) {
      RankingSingleton.instance.ranking.value =
      await storage.read(pathRanking).map((val) => RankingModel.fromJson(val))
          .toList()
          .cast<RankingModel>();
      RankingSingleton.instance.ranking.forEach((e) {
        print("${e.nomeDoJogador} - ${e.dataDoJogo}");
      });
    }
    else {
      return;
    }
  }

  void salvarRankingNaMemoriaLocal() async {
    try{
      final list = RankingSingleton.instance.ranking.value.map((e) => RankingModel(
        nomeDoJogador: e.nomeDoJogador,
        dataDoJogo: e.dataDoJogo,
        pontuacao: e.pontuacao,
        nivelAlcancado: e.nivelAlcancado
      ).toJson()).toList();
      await storage.write(pathRanking, list);

      RankingSingleton.instance.ranking.forEach((e) {print("${e.nomeDoJogador} - ${e.dataDoJogo}");});
    } catch (e){
      print("Erro ao Salvar na Memória Local");
    }
  }



}