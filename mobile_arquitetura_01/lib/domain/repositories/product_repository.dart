import '../models/product.dart';

/// Contrato abstrato para operações de repositório de produtos
/// Define a interface que deve ser implementada pelas fontes de dados
abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String id);
  Future<Product> addProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
