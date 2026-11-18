import 'package:flutter/material.dart';
import 'package:flutter_ulangan/controller/team_controller.dart';
import 'package:flutter_ulangan/models/team_model.dart';
import 'package:get/get.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Daftar Klub",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.listMakanan.isEmpty) {
                return Center(child: Text("Data klub tidak tersedia"));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.listMakanan.length,
                itemBuilder: (context, index) {
                  final makanan = controller.listMakanan[index];
                  return Container(
                    width: 150,
                    margin: EdgeInsets.only(left: 10),
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              makanan.strBadge,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.fastfood);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text(makanan.strTeam),
                                Text(makanan.strStadium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}