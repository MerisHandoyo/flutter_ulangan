import 'package:flutter/material.dart';
import 'package:flutter_ulangan/components/custom.text.dart';
import 'package:flutter_ulangan/components/custom_icon.dart';
import 'package:flutter_ulangan/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
   final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(icon: Icon(Icons.arrow_back)),
                  CustomIcon(icon: Icon(Icons.help_outline)),
                ],
              ),
              CustomText(
                text: "Masuk ke Tokopedia",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.txtUsername,
                decoration: InputDecoration(
                  hintText: "Isi Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                ),
                 
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.txtPassword,
                decoration: InputDecoration(
                  hintText: "Isi Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              SizedBox(height: 20),
              
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text("Login"),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}