/// Modelo de Produto para a camada de Domínio
/// Representa uma entidade de negócio
class Product {
  final String? id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  Product({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  /// Converte JSON da API para Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString(),
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }

  /// Converte Product para JSON para enviar à API
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }
}
