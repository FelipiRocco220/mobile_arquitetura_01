import 'package:flutter/material.dart';
import '../domain/entities/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.image, height: 180),
            ),
            const SizedBox(height: 24),
            Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('R\$ ${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            // Descrição fictícia, pois não está no modelo atual
            const Text('Descrição do produto não disponível.'),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Favorito:'),
                Icon(
                  product.favorite ? Icons.star : Icons.star_border,
                  color: product.favorite ? Colors.amber : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
