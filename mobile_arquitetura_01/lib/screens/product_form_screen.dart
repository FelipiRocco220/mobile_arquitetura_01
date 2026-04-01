import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/models/product.dart';
import '../presentation/product_provider.dart';
import '../widgets/product_form_field.dart';
import '../widgets/product_form_field.dart';

/// Tela de formulário para cadastro e edição de produtos
/// Utiliza a mesma tela para ambas operações (new ou edit)
/// Se receber um produto, está em modo edição; caso contrário, cadastro
class ProductFormScreen extends StatefulWidget {
  final Product? product;

  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageController;
  late TextEditingController _categoryController;
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product?.title ?? '');
    _priceController =
        TextEditingController(text: widget.product?.price.toString() ?? '');
    _descriptionController =
        TextEditingController(text: widget.product?.description ?? '');
    _imageController = TextEditingController(text: widget.product?.image ?? '');
    _categoryController =
        TextEditingController(text: widget.product?.category ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _saveProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final provider = Provider.of<ProductProvider>(context, listen: false);
      final product = Product(
        id: widget.product?.id,
        title: _titleController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        image: _imageController.text,
        category: _categoryController.text,
      );

      if (widget.product == null) {
        // Novo produto
        await provider.addProduct(product);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto criado com sucesso!')),
          );
        }
      } else {
        // Editar produto existente
        await provider.updateProduct(product);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto atualizado com sucesso!')),
          );
        }
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Produto' : 'Novo Produto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductFormField(
                label: 'Título',
                initialValue: _titleController.text,
                hint: 'Digite o título do produto',
                onChanged: (value) => _titleController.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Título é obrigatório';
                  }
                  return null;
                },
              ),
              ProductFormField(
                label: 'Preço',
                initialValue: _priceController.text,
                hint: 'Digite o preço',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _priceController.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preço é obrigatório';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Preço deve ser um número válido';
                  }
                  return null;
                },
              ),
              ProductFormField(
                label: 'Categoria',
                initialValue: _categoryController.text,
                hint: 'Digite a categoria',
                onChanged: (value) => _categoryController.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Categoria é obrigatória';
                  }
                  return null;
                },
              ),
              ProductFormField(
                label: 'Descrição',
                initialValue: _descriptionController.text,
                hint: 'Digite a descrição do produto',
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                onChanged: (value) => _descriptionController.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Descrição é obrigatória';
                  }
                  return null;
                },
              ),
              ProductFormField(
                label: 'URL da Imagem',
                initialValue: _imageController.text,
                hint: 'Digite a URL da imagem',
                keyboardType: TextInputType.url,
                onChanged: (value) => _imageController.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL da imagem é obrigatória';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _saveProduct,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(isEditing ? 'Atualizar' : 'Criar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
