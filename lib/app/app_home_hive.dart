import 'package:flutter/material.dart';
import 'package:move_off_sync/app/app_controller.dart';
import 'package:move_off_sync/app/model/product_model.dart';

class AppHomeHive extends StatefulWidget {
  const AppHomeHive({Key? key}) : super(key: key);

  @override
  _AppHomeHiveState createState() => _AppHomeHiveState();
}

class _AppHomeHiveState extends State<AppHomeHive> {
  late AppController controller;
  late ProductModel productModel;

  bool showSyncButton = false;

  bool showReadButton = true;

  @override
  void initState() {
    productModel = ProductModel(
      products: [],
    );

    controller = AppController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            child: TextButton(
              onPressed: () {
                controller.getAll().then((value) {
                  setState(() {
                    productModel = value;
                  });
                });
              },
              child: const Text(
                'read local db',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Visibility(
            visible: showSyncButton,
            child: TextButton(
              onPressed: () => controller.insertAll(productModel).then(
                (_) {
                  setState(() {
                    productModel.products!.clear();
                  });
                },
              ),
              child: const Text(
                'send to local db',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => controller.getData().then(
              (ProductModel model) {
                setState(() {
                  productModel = model;

                  showSyncButton = true;
                });
              },
            ),
            child: const Text(
              'read json',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productModel.products!.length,
        itemBuilder: (ctx, i) {
          final Product product = productModel.products![i];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => setState(() {
                productModel = controller.updateProduct(product.productId!);
              }),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              tileColor: Colors.grey.withOpacity(0.2),
              title: Text(
                product.name!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(product.description!),
            ),
          );
        },
      ),
    );
  }
}
