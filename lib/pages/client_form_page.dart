import 'package:flutter/material.dart';
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/services/database_service.dart';

class AddClientFormPage extends StatefulWidget {
  const AddClientFormPage({Key? key}) : super(key: key);

  @override
  _AddClientFormPageState createState() => _AddClientFormPageState();
}

class _AddClientFormPageState extends State<AddClientFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final address = _addressController.text;
    final city = _cityController.text;
    final phone = _phoneController.text;
    final email = _emailController.text;
    final remarks = _remarksController.text;

    await _databaseService.insertClient(Clients(name: name, address: address,city: city,phone: phone,email: email,remarks: remarks));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Client'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name ',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Address',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter city',
                ),
              ),
              SizedBox(height: 16.0),

              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter phone',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _remarksController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Remarks',
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 45.0,
                child: ElevatedButton(
                  onPressed: _onSave,
                  child: Text(
                    'Save the Breed',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
