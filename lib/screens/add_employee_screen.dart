import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference().child('employees');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _addEmployee();
                Navigator.pop(context, true);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _addEmployee() {
    String name = _nameController.text.trim();
    String position = _positionController.text.trim();

    if (name.isNotEmpty && position.isNotEmpty) {
      _databaseReference.push().set({
        'name': name,
        'position': position,
      }).then((_) {
        // Penambahan data berhasil
        Navigator.pop(addEmployee, true);
      }).catchError((error) {
        // Penanganan error saat penambahan data gagal
        print("Error adding employee: $error");
        // Anda bisa menambahkan penanganan error lainnya sesuai kebutuhan
      });
    }

  });
    }
  }
}
