import 'package:courtlex/common_widgets/client_builder.dart';
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/models/dog.dart';
import 'package:courtlex/pages/client_form_page.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ClientDetailsPage extends StatefulWidget {
  const ClientDetailsPage({Key? key}) : super(key: key);
  @override
  _ClientDetailsPageState createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Dog>> _getDogs() async {
    return await _databaseService.dogs();
  }
  Future<List<Clients>> _getClients() async {
    return await _databaseService.clients();
  }

  Future<void> _onDogDelete(Dog dog) async {
    await _databaseService.deleteDog(dog.id!);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clients Details'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Basic Details'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Cases'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Schedules'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Notes'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Nothing to display yet"),),
            Center(child: Text("Nothing to display yet"),),
            Center(child: Text("Nothing to display yet"),),
            Center(child: Text("Nothing to display yet"),),
            /*
            ClientBuilder(
              future: _getClients(),
            ),
           DogBuilder(
              future: _getDogs(),
              onEdit: (value) {
                {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (_) => DogFormPage(dog: value),
                      fullscreenDialog: true,
                    ),
                  )
                      .then((_) => setState(() {}));
                }
              },
              onDelete: _onDogDelete,
            ),
            ClientBuilder(
              future: _getClients(),
            ),
            ClientBuilder(
              future: _getClients(),
            ),
            ClientBuilder(
              future: _getClients(),
            ),*/

          ],
        ),

      ),
    );
  }
}
