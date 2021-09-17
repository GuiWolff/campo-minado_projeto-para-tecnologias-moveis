
part of 'ranking_model.dart';

RankingModel _$RankingModelFromJson(Map<String, dynamic> json) {

  return RankingModel(
    dataDoJogo: DateTime.parse(json['data_do_jogo'] as String),
    pontuacao: json['nota_avaliativa'] as int,
    nomeDoJogador: json['nome_do_jogador'],
    nivelAlcancado: json['nivel_alcancado'],
  );
}

Map<String, dynamic> _$ExercicioModelToJson(RankingModel instance) =>
    <String, dynamic>{
      'data_do_jogo' : instance.dataDoJogo.toString(),
      'nota_avaliativa' : instance.pontuacao,
      'nome_do_jogador' : instance.nomeDoJogador,
      'nivel_alcancado' : instance.nivelAlcancado,
};
