
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trabalho1/repository/ranking/ranking_repository.dart';
import 'package:trabalho1/widgets/botao.dart';
import 'package:trabalho1/widgets/drawer.dart';

import 'pages/gameplay/gameplay_page.dart';

class IntroducaoPageController extends GetxController {

  IntroducaoPageController(){
    RankingRepository();
  }
}
