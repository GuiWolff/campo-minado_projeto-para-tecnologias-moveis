
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trabalho1/model/ranking/ranking_model.dart';
import 'package:trabalho1/repository/ranking/ranking_repository.dart';
import 'package:trabalho1/repository/ranking/ranking_singleton.dart';

class CadastroJogadorPageController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final textControllerNome = TextEditingController();

  String? validarNome(String? _nome) {
    if (_nome == null || _nome == "") {
      return "O nome deve ser preenchido";
    }else{
      RankingSingleton.instance.nomeDoJogador = _nome;
      salvarJogador();
    }
  }

  void salvarJogador() {
    RankingSingleton.instance.ranking.add(
        RankingModel(
            nomeDoJogador: RankingSingleton.instance.nomeDoJogador,
            nivelAlcancado: RankingSingleton.instance.nivelAlcancado,
            pontuacao: RankingSingleton.instance.pontuacao,
            dataDoJogo: RankingSingleton.instance.data
        )
    );
     RankingRepository().salvarRankingNaMemoriaLocal();
  }


}
