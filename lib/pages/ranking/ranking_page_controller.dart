

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trabalho1/repository/ranking/ranking_repository.dart';

class RankingPageController extends GetxController {

  RankingPageController(){
    RankingRepository();
  }

  String datetimeToString(DateTime dateTime){
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(dateTime).toString();
  }

}


