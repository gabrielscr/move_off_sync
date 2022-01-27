import 'package:flutter/material.dart';
import 'package:move_off_sync/app/app_controller.dart';
import 'package:move_off_sync/app/app_sqlite_controller.dart';
import 'package:move_off_sync/app/model/product_model.dart';

class AppHomeSqlite extends StatefulWidget {
  const AppHomeSqlite({Key? key}) : super(key: key);

  @override
  _AppHomeSqliteState createState() => _AppHomeSqliteState();
}

class _AppHomeSqliteState extends State<AppHomeSqlite> {
  late AppController controller;
  late AppSqliteController appBoxController;
  late ProductModel productModel;

  bool showSyncButton = false;

  bool showReadButton = true;

  @override
  void initState() {
    productModel = ProductModel(
      products: [],
    );

    controller = AppController();

    appBoxController = AppSqliteController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            child: TextButton(
              onPressed: () => appBoxController.getAll().then((value) {
                setState(() {
                  productModel.products = value;

                  productModel = productModel;

                  showReadButton = false;
                });
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
                appBoxController.insertAllProducts(productModel.products!).then((value) {
                  showReadButton = true;

                  setState(() {
                    productModel.products!.clear();
                  });
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
              onTap: () => appBoxController.updateProduct(product).then((value) {
                setState(() {
                  productModel.products = value;

                  productModel = productModel;
                });
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
