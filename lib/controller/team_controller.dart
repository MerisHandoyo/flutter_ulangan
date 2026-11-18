import 'dart:convert';

import 'package:flutter_ulangan/models/team_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TeamController extends GetxController {
  RxList<Team> listMakanan = <Team>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMakanan();
  }

  Future<void> getMakanan() async {
    try {
      isLoading.value = true;

      final url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<dynamic> products = data['products'];

        listMakanan.assignAll(
          products.map((item) => Team.fromJson(item)).toList(),
        );
      } else {
        print('Gagal mengambil data: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void removeMakanan(int index) {
    listMakanan.removeAt(index);
  }
}
