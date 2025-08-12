
import 'package:get/get.dart';
import '../models/player_model.dart';

class FootballController extends GetxController {
  var player = <Player>[
    Player(image: "", name: "Player John", posisi: "penyerang", nomorPunggung: 13),
    Player(image: "", name: "Player Joseph", posisi: "gelandang", nomorPunggung: 7),
    Player(image: "", name: "Player Antony", posisi: "bek", nomorPunggung: 24),
    Player(image: "", name: "Player Lukaku", posisi: "kiper", nomorPunggung: 1),
    Player(image: "", name: "Player Markus", posisi: "pemandu sorak", nomorPunggung: 404),
  ].obs;
}

