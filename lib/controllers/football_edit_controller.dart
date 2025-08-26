import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';
import 'football_controller.dart';

class FootballEditController extends GetxController {
  late int index;
  late Rx<Player> player;

  final footballController = Get.find<FootballController>();

  // pindahkan text controller ke sini
  final nameController = TextEditingController();
  final posisiController = TextEditingController();
  final nomorController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Ambil index dari Get.arguments
    index = Get.arguments as int;
    player = footballController.player[index].obs;

    // set nilai awal ke textfield
    nameController.text = player.value.name;
    posisiController.text = player.value.posisi;
    nomorController.text = player.value.nomorPunggung.toString();
  }

  void updatePlayer() {
    final updated = Player(
      image: player.value.image,
      name: nameController.text,
      posisi: posisiController.text,
      nomorPunggung: int.tryParse(nomorController.text) ?? player.value.nomorPunggung,
    );

    footballController.player[index] = updated; // update ke list
    footballController.update(); // trigger UI refresh
  }
}
