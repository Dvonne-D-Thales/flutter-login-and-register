import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/premier_table_controller.dart';

class PremierPages extends StatelessWidget {
  PremierPages({super.key});
  final PremierTableController premierTableController = Get.find<PremierTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premier League Pages'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (premierTableController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              premierTableController.fetchPremierTable();
            },
            child: ListView.builder(
              itemCount: premierTableController.standing.length,
              itemBuilder: (context, index) {
                final team = premierTableController.standing[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge ),
                    ),
                    trailing: Text(team.intRank ),
                    title: Text(team.strTeam ),
                    subtitle: Text(
                      'Points: ${team.intPoints} | Rank: ${team.intRank}\n'
                      'Win: ${team.intWin} | Draw: ${team.intDraw} | Loss: ${team.intLoss}',
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
