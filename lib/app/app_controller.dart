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

    return ProductModel.fromJson(
      json.decode(response),
    );
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
      print('terminou leitura... ${stopwatch.elapsedMilliseconds}ms');
    }

    return produto;
  }
}
