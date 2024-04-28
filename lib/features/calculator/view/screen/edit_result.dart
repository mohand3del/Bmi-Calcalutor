
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditResultScreen extends StatefulWidget {
  const EditResultScreen({super.key, required this.resultId});

  final String resultId;

  @override
  State<EditResultScreen> createState() => _EditResultScreenState();
}

class _EditResultScreenState extends State<EditResultScreen> {
  final _formKey = GlobalKey<FormState>(); // Optional for form management
  final resultController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          // Optional for form validation
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: resultController,
                decoration: InputDecoration(
                  labelText: 'Result',
                ),
                validator: (value) {
                  // Optional validation logic
                  if (value == null || value.isEmpty) {
                    return 'Please enter a result.';
                  }
                  return null;
                },
              ),
              // Add other edit fields here (age, bmi)
              ElevatedButton(
                onPressed: () => _saveChanges(), // Call save function
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }


  
    try {
      final doc = await FirebaseFirestore.instance
          .collection('bmi_data')
          .doc(widget.resultId);
      doc.update(
        {'result': resultController.text},
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Result updated successfully'),
        ),
      );
      Navigator.pop(context);
    } on Exception catch (error) {
      print("Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Document not found'),
        ),
      );
    } catch (error) {
      // Handle other errors
      print("Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }
}
