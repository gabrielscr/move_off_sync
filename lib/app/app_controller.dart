import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:move_off_sync/app/model/product_model.dart';
import 'package:move_off_sync/core/storage/local_storage.dart';

class AppController {
  late final LocalStorage storage;

  Future<ProductModel> getData() async {
    final String response = await rootBundle.loadString('assets/offline/product.json');

    final produtos = ProductModel.fromJson(
      json.decode(response),
    );

    return produtos;
  }

  //Hive: Tempo de resposta pra inserir lista no db local: 20 ~ 50 ms
  Future<void> insertAll(ProductModel model) async {
    storage = await LocalStorageImpl.instance;

    storage.put(
      'products',
      model.toJson(),
    );
  }

//Hive: Tempo de resposta pra obter lista para atualizar o listview: 8 ~ 20ms
  Future<ProductModel> getAll() async {
    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    return produto;
  }

//Hive: Tempo de resposta pra realizar update e obter lista para atualizar o listview: 30 ~ 45ms
  ProductModel updateProduct(int id) {
    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    final produtoEncontrado = produto.products!.firstWhere((e) => e.productId == id);

    produtoEncontrado.description = 'oi';

    storage.put(
      'products',
      produto.toJson(),
    );

    return ProductModel.fromJson(storage.get('products'));
  }
}
