import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/mainmenu_controller.dart';
import 'package:latihan_11pplg1/fragmen/history_fragmen.dart';
import 'package:latihan_11pplg1/fragmen/home_fragment.dart';
import 'package:latihan_11pplg1/fragmen/profil_fragmen.dart';

class MainmenuPage extends StatelessWidget {
   MainmenuPage({super.key});

   final MainMenuController mainMenuC = Get.put(MainMenuController());

   //var global untuk deklarasi isi menun nya
   final List<Widget> _pages = [
     //panggil fragment yang sudah dibuat
     const HomeFragment(),
     const HistoryFragmen(),
     const ProfilFragmen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: _pages[mainMenuC.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainMenuC.selectedIndex.value,
        onTap: (index) => mainMenuC.changeMenu(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          
        ],
      ),
    ));
  }
}