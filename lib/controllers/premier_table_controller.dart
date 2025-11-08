import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_11pplg1/models/tabel_model_premier.dart';

class PremierTableController extends GetxController {
  var isLoading = false.obs;
  var standing = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPremierTable();
  }

  void fetchPremierTable() async {
    const url = 'https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standingsData = data['table'];

        standing.assignAll(
          standingsData.map((e) => Table.fromJson(e)).toList()
        );

        print("Status Code : ${response.statusCode}");
        print("Json : ${response.body}");
      } else {
        Get.snackbar('Error', 'Failed to load Premier Table data');
      }

    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
