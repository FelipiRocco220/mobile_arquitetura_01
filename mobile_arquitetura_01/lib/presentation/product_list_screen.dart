import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

            if (provider.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Erro ao carregar produtos:'),
                    Text(provider.error!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 16),
                    const Text('Exibindo dados em cache, se disponíveis.'),
                  ],
                ),
              );
            }

          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ListTile(
                leading: Image.network(product.image, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(product.title),
                subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(
                    product.favorite ? Icons.star : Icons.star_border,
                    color: product.favorite ? Colors.amber : null,
                  ),
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false).toggleFavorite(product);
                  },
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detalhes',
                    arguments: product,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}