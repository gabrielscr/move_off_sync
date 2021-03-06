import 'package:flutter/material.dart';
import 'package:move_off_sync/app/app_box_controller.dart';
import 'package:move_off_sync/app/app_controller.dart';
import 'package:move_off_sync/app/model/product_model.dart';

class AppHomeBox extends StatefulWidget {
  const AppHomeBox({Key? key}) : super(key: key);

  @override
  _AppHomeBoxState createState() => _AppHomeBoxState();
}

class _AppHomeBoxState extends State<AppHomeBox> {
  late AppController controller;
  late AppBoxController appBoxController;
  late ProductModel productModel;

  bool showSyncButton = false;

  bool showReadButton = true;

  @override
  void initState() {
    productModel = ProductModel(
      products: [],
    );

    controller = AppController();

    appBoxController = AppBoxController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            child: TextButton(
              onPressed: () => setState(() {
                productModel.products = appBoxController.getAll();

                productModel = productModel;

                showReadButton = false;
              }),
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
              onPressed: () {
                appBoxController.insertAllProducts(productModel.products!);

                showReadButton = true;

                setState(() {
                  productModel.products!.clear();
                });
              },
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
                productModel = appBoxController.updateProduct(product.id);
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
