import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

/// Serviço centralizado para operações de API relacionadas a produtos
/// Implementa CRUD: Create (POST), Read (GET), Update (PUT), Delete (DELETE)
class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com';

  /// Busca todos os produtos da API
  /// GET /products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar produtos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar produtos: $e');
    }
  }

  /// Busca um produto específico pelo ID
  /// GET /products/{id}
  Future<Product> getProductById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Produto não encontrado: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar produto: $e');
    }
  }

  /// Cria um novo produto (POST)
  /// POST /products
  Future<Product> addProduct(Product product) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Falha ao adicionar produto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao adicionar produto: $e');
    }
  }

  /// Atualiza um produto existente (PUT)
  /// PUT /products/{id}
  Future<Product> updateProduct(Product product) async {
    if (product.id == null) {
      throw Exception('Produto sem ID não pode ser atualizado');
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Falha ao atualizar produto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao atualizar produto: $e');
    }
  }

  /// Deleta um produto (DELETE)
  /// DELETE /products/{id}
  Future<void> deleteProduct(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/products/$id'),
      );

      if (response.statusCode != 200) {
        throw Exception('Falha ao deletar produto: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao deletar produto: $e');
    }
  }
}
