import 'package:flutter/material.dart';
import 'package:flutter_ulangan/controller/list_makanan_controller.dart';
import 'package:flutter_ulangan/routes.dart';
import 'package:get/get.dart';

class ListmakananPage extends StatelessWidget {
  ListmakananPage({super.key});

  final controller = Get.put(ListmakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Makanan")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.listMakanan.isEmpty) {
          return Center(child: Text("Data makanan tidak tersedia"));
        }
        return ListView.builder(
          itemCount: controller.listMakanan.length,
          itemBuilder: (context, index) {
            final makanan = controller.listMakanan[index];

            return Dismissible(
              key: ValueKey(makanan.id),
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                //controller.removeMakanan(index);
              },
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.detail_makanan, arguments: makanan);
                },
                child: ListTile(
                  leading: Image.network(
                    makanan.thumbnail,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(makanan.title),
                  subtitle: Text("Rp ${makanan.price}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
