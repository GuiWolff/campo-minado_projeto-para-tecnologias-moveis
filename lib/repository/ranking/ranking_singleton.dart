
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:trabalho1/model/ranking/ranking_model.dart';

class RankingSingleton {

  RxList<RankingModel> ranking = [].cast<RankingModel>().obs;
  String nomeDoJogador = "";
  int nivelAlcancado = 1;
  int pontuacao = 0;
  DateTime data = DateTime.now();

  static RankingSingleton _getInstance() => _instance ??= RankingSingleton._internal();

  factory RankingSingleton() => _getInstance();

  static RankingSingleton get instance => _getInstance();

  static RankingSingleton? _instance;

  RankingSingleton._internal();
}

