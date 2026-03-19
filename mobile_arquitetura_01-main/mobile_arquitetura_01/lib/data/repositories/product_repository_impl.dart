import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

/// O mecanismo de cache foi implementado nesta camada (Repository),
/// pois é responsabilidade do repositório decidir de onde vêm os dados.
/// Assim, a arquitetura em camadas é respeitada e a UI/ViewModel não
/// precisa conhecer detalhes de cache ou fontes de dados.
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  List<Product>? _cache;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    // Se houver cache, retorna imediatamente
    if (_cache != null && _cache!.isNotEmpty) {
      return _cache!;
    }
    try {
      final models = await remoteDataSource.getProducts();
      final products = models.map((model) => model.toEntity()).toList();
      _cache = products;
      return products;
    } catch (e) {
      // Se falhar, tenta retornar do cache
      if (_cache != null && _cache!.isNotEmpty) {
        return _cache!;
      }
      rethrow;
    }
  }
}