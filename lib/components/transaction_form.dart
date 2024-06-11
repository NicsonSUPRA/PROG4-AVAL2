import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(label: Text("Título")),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(label: Text("Valor")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        valueController.text.isEmpty) {
                      return;
                    }
                    widget.onSubmit(titleController.text,
                        double.tryParse(valueController.text) ?? 0.0);
                  },
                  child: Text("Salvar Transação")),
            )
          ],
        ),
      ),
    );
  }
}
