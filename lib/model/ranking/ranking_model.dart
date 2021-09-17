

part 'ranking_model.g.dart';

class RankingModel{

  DateTime dataDoJogo;
  int pontuacao;
  String nomeDoJogador;
  int nivelAlcancado;

  RankingModel({required this.dataDoJogo, required this.pontuacao, required this.nomeDoJogador, required this.nivelAlcancado});

  factory RankingModel.fromJson(Map<String, dynamic> json) => _$RankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExercicioModelToJson(this);
}

//flutter pub run build_runner build