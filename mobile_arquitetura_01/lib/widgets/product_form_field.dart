import 'package:flutter/material.dart';

/// Widget reutilizável para campos de formulário
class ProductFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final String? hint;
  final TextInputType keyboardType;
  final int maxLines;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const ProductFormField({
    super.key,
    required this.label,
    this.initialValue,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: maxLines == 1 ? 1 : maxLines,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
