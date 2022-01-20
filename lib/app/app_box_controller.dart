import 'package:move_off_sync/app/model/product_model.dart';
import 'package:move_off_sync/objectbox.g.dart';

class AppBoxController {
  late final Store store;

  late final Box<Product> box;

  AppBoxController() {
    initBox();
  }

  //Iniciando o object box
  Future<void> initBox() async {
    final store = await openStore();

    box = Box<Product>(store);
  }

//ObjectBox: Tempo de resposta pra obter lista para atualizar o listview: 5 ~ 15ms
  List<Product> getAll() {
    return box.getAll(); //Obtém todos os produtos do banco local
  }

//ObjectBox: Tempo de resposta pra inserir lista de produtos no banco de dados local: 100 ~ 200ms
  void insertAllProducts(List<Product> products) {
    box.putMany(products); //Insere todos os produtos encontrados do JSON
  }

//ObjectBox: Tempo de resposta pra deletar produto e obter lista para atualizar o listview: 10 ~ 20ms
  void removeProduct(int id) {
    box.remove(id); //Remove produto conforme o id;

    ProductModel productModel = ProductModel()
      ..products = box.getAll(); //Obtém listagem para atualizar o ListView
  }

  //ObjectBox: Tempo de resposta pra obter lista para atualizar o listview: 5 ~ 8ms
  ProductModel updateProduct(int id) {
    final product = box.get(id); //Obtém o produto com base no ID

    product!.description = 'oi';

    box.put(product); //Atualiza o produto encontrado

    ProductModel productModel = ProductModel()
      ..products = box.getAll(); //Obtém listagem para atualizar o ListView

    return productModel;
  }
}
