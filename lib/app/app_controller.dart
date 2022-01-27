import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:move_off_sync/app/model/product_model.dart';
import 'package:move_off_sync/core/storage/local_storage.dart';

class AppController {
  late final LocalStorage storage;

  AppController() {
    initStorage();
  }

  Future<ProductModel> getData() async {
    final String response = await rootBundle.loadString('assets/offline/product.json');

    final produtos = ProductModel.fromJson(
      json.decode(response),
    );

    // for (var prods in produtos.products!) {
    //   prods.productId = produtos.products!.indexOf(prods) + 1;
    // }

    // final jsxon = jsonEncode(produtos);

    return produtos;
  }

  //Hive: Tempo de resposta pra inserir lista no db local: 20 ~ 50 ms
  Future<void> insertAll(ProductModel model) async {
    Stopwatch watch = Stopwatch()..start();

    storage.put(
      'products',
      model.toJson(),
    );

    print('Hive >>>>>>>> insertAll() => ${watch.elapsedMilliseconds} ms');
  }

//Hive: Tempo de resposta pra obter lista para atualizar o listview: 8 ~ 20ms
  Future<ProductModel> getAll() async {
    Stopwatch watch = Stopwatch()..start();
    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    print('Hive >>>>>>>> getAll() => ${watch.elapsedMilliseconds} ms');

    return produto;
  }

//Hive: Tempo de resposta pra realizar update e obter lista para atualizar o listview: 30 ~ 45ms
  ProductModel updateProduct(int id) {
    Stopwatch watch = Stopwatch()..start();
    final ProductModel produto = ProductModel.fromJson(storage.get('products'));

    final produtoEncontrado = produto.products!.firstWhere((e) => e.productId == id);

    produtoEncontrado.description = 'oi';

    storage.put(
      'products',
      produto.toJson(),
    );

    print('Hive >>>>>>>> updateProduct() => ${watch.elapsedMilliseconds} ms');

    return ProductModel.fromJson(storage.get('products'));
  }

  Future<void> initStorage() async {
    storage = await LocalStorageImpl.instance;
  }
}
