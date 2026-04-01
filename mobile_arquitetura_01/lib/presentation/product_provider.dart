import 'package:flutter/material.dart';
import '../domain/models/product.dart';
import '../data/repositories/product_repository_impl.dart';
import '../data/datasources/product_remote_datasource.dart';

/// Provider (ViewModel) que coordena o estado da aplicação
/// Gerencia fetch, criar, atualizar e deletar produtos
/// Utiliza Provider para notificar mudanças à UI
class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ProductRepositoryImpl _repository =
      ProductRepositoryImpl(ProductRemoteDataSource());

  /// Busca todos os produtos da API com tratamento de cache
  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _repository.getProducts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Cria um novo produto (POST)
  Future<void> addProduct(Product product) async {
    try {
      final newProduct = await _repository.addProduct(product);
      _products.add(newProduct);
      _error = null;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// Atualiza um produto existente (PUT)
  Future<void> updateProduct(Product product) async {
    try {
      final updatedProduct = await _repository.updateProduct(product);
      final index = _products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        _products[index] = updatedProduct;
      }
      _error = null;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  /// Deleta um produto (DELETE)
  Future<void> deleteProduct(String id) async {
    try {
      await _repository.deleteProduct(id);
      _products.removeWhere((product) => product.id == id);
      _error = null;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }
}