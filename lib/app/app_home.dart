import 'package:flutter/material.dart';
import 'package:move_off_sync/app/app_controller.dart';
import 'package:move_off_sync/app/model/product_model.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late AppController controller;
  late ProductModel productModel;

  bool showSyncButton = false;

  bool showReadButton = false;

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
            visible: showReadButton,
            child: TextButton(
              onPressed: () => controller.readContentFromDevice().then(
                (ProductModel model) {
                  setState(() {
                    productModel = model;

                    showReadButton = false;
                  });
                },
              ),
              child: const Text(
                'read from device',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Visibility(
            visible: showSyncButton,
            child: TextButton(
              onPressed: () => controller.sendContentToDevice(productModel).then(
                (_) {
                  setState(() {
                    productModel.products.clear();

                    showReadButton = true;
                  });
                },
              ),
              child: const Text(
                'send to device',
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
              'get data (json)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Visibility(
        visible: showReadButton,
        child: const Center(
          child: Text('Files sent!'),
        ),
        replacement: ListView.builder(
          itemCount: productModel.products.length,
          itemBuilder: (ctx, i) {
            final Products product = productModel.products[i];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                tileColor: Colors.grey.withOpacity(0.2),
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(product.description),
              ),
            );
          },
        ),
      ),
    );
  }
}