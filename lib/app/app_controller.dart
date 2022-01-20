import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
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

  Future<void> sendContentToDevice(ProductModel model) async {
    storage = await LocalStorageImpl.instance;

    storage.delete('products');

    storage.put(
      'products',
      model.toJson(),
    );
  }

  Future<ProductModel> readContentFromDevice() async {
    Stopwatch stopwatch = Stopwatch()..start();

    if (kDebugMode) {
      print('iniciando leitura...');
    }

    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    if (kDebugMode) {
      print('terminou leitura em ${stopwatch.elapsedMilliseconds}ms');
    }

    return produto;
  }

  ProductModel updateAndList(int id) {
    Stopwatch stopwatch = Stopwatch()..start();

    if (kDebugMode) {
      print('iniciando update');
    }

    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    final produtoEncontrado = produto.products!.firstWhere((e) => e.productId == id);

    produtoEncontrado.description = 'oi';

    storage.put(
      'products',
      produto.toJson(),
    );

    final model = ProductModel.fromJson(storage.get('products'));

    if (kDebugMode) {
      print('terminou update em ${stopwatch.elapsedMilliseconds}ms');
    }

    return model;
  }
}
