import 'package:expenses/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? dateController;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
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
              controller: descriptionController,
              decoration: InputDecoration(label: Text("Descrição")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2022),
                        lastDate: DateTime.now().add(Duration(days: 300)),
                      ).then((value) => dateController = value);
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
                Text("Data")
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        descriptionController.text.isEmpty) {
                      return;
                    }

                    taskProvider.save(
                        titleController.text,
                        descriptionController.text,
                        dateController ?? DateTime.now());
                    Navigator.of(context).pop();
                  },
                  child: Text("Salvar Transação")),
            )
          ],
        ),
      ),
    );
  }
}
