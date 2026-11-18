import 'package:flutter_ulangan/models/makanan_model.dart';

class CartItemModel {
  final MakananModel makanan;
  int quantity;

  CartItemModel({required this.makanan, this.quantity = 1});
}
