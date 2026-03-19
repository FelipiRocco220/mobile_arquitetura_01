import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/product_list_screen.dart';
import 'presentation/home_screen.dart';
import 'presentation/product_detail_screen.dart';
import 'presentation/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Aplicativo de Produtos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/produtos': (context) => const ProductListScreen(),
          '/detalhes': (context) {
            final product = ModalRoute.of(context)!.settings.arguments as Product;
            return ProductDetailScreen(product: product);
          },
        },
      ),
    );
  }
}