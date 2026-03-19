import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../data/datasources/product_remote_datasource.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ProductRepositoryImpl _repository = ProductRepositoryImpl(ProductRemoteDataSource());

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
  void toggleFavorite(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index].favorite = !_products[index].favorite;
      notifyListeners();
    }
  }
}