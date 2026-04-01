import '../../domain/models/product.dart';

/// Modelo de Produto da camada de dados
/// Especializado em converter dados da API para entidade de domínio
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  /// Converte JSON da API para ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }

  /// Converte ProductModel para JSON para envar à API
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }

  /// Converte ProductModel para entidade de domínio
  Product toEntity() {
    return Product(
      id: id.toString(),
      title: title,
      price: price,
      description: description,
      image: image,
      category: category,
    );
  }
}
