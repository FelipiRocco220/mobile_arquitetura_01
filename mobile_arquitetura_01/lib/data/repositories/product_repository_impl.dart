import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

/// Implementação do repository que coordena a busca de dados
/// Decide se busca da API ou do cache
/// Converte dados brutos para entidades de domínio
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  List<ProductModel>? _cache;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    // Retorna do cache se disponível
    if (_cache != null && _cache!.isNotEmpty) {
      return _cache!.map((model) => model.toEntity()).toList();
    }

    try {
      final jsonList = await remoteDataSource.getProducts();
      final models = jsonList
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
      _cache = models;
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Tenta usar cache em caso de erro
      if (_cache != null && _cache!.isNotEmpty) {
        return _cache!.map((model) => model.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final data = await remoteDataSource.getProductById(id);
      final model = ProductModel.fromJson(data as Map<String, dynamic>);
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> addProduct(Product product) async {
    try {
      final data = await remoteDataSource.addProduct({
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'image': product.image,
        'category': product.category,
      });
      final model = ProductModel.fromJson(data as Map<String, dynamic>);
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> updateProduct(Product product) async {
    try {
      final data = await remoteDataSource.updateProduct(
        product.id ?? '',
        {
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'image': product.image,
          'category': product.category,
        },
      );
      final model = ProductModel.fromJson(data as Map<String, dynamic>);
      return model.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await remoteDataSource.deleteProduct(id);
    } catch (e) {
      rethrow;
    }
  }
}
