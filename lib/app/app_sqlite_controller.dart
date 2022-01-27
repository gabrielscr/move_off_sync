import 'package:move_off_sync/app/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppSqliteController {
  AppSqliteController() {
    initializeDB();
  }

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'poc_move.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE products(productId INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertAllProducts(List<Product> products) async {
    Stopwatch watch = Stopwatch()..start();

    int result = 0;
    final Database db = await initializeDB();

    for (var product in products) {
      result = await db.insert('products', product.toJson());
    }

    print('SQLite >>>>>>>> insertAllProducts() => ${watch.elapsedMilliseconds} ms');

    return result;
  }

  Future<List<Product>> getAll() async {
    Stopwatch watch = Stopwatch()..start();

    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('products');

    final products = queryResult.map((e) => Product.fromJson(e)).toList();
    print('SQLite >>>>>>>> getAll() => ${watch.elapsedMilliseconds} ms');
    return products;
  }

  Future<void> deleteProduct(int id) async {
    final db = await initializeDB();
    await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Product>> updateProduct(Product product) async {
    Stopwatch watch = Stopwatch()..start();

    final db = await initializeDB();

    product.description = 'oi';

    await db.update('products', product.toJson(),
        where: 'productId = ?', whereArgs: [product.productId]);

    final List<Map<String, Object?>> queryResult = await db.query('products');

    final products = queryResult.map((e) => Product.fromJson(e)).toList();
    print('SQLite >>>>>>>> updateProduct() => ${watch.elapsedMilliseconds} ms');
    return products;
  }
}
