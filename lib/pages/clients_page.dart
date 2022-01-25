
import 'package:courtlex/common_widgets/client_builder.dart';
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'client_form_page.dart';

class ClientsList extends StatefulWidget {
  const ClientsList({Key? key}) : super(key: key);

  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  final DatabaseService _databaseService = DatabaseService();
  Future<List<Clients>> _getClients() async {
    return await _databaseService.clients();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clients"),
      ),
      body: ClientBuilder(
        future: _getClients(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (_) => AddClientFormPage(),
                  fullscreenDialog: true,
                ),
              )
                  .then((_) => setState(() {}));
            },
           // heroTag: 'addBreed',
            child: FaIcon(FontAwesomeIcons.plus),
          ),
          SizedBox(height: 12.0),
          /* FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => DogFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addDog',
              child: FaIcon(FontAwesomeIcons.fingerprint),
            ),*/
        ],
      ),
    );
  }
}
