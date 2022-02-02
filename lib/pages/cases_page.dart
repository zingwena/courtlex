import 'package:courtlex/common_widgets/case_builder.dart';
import 'package:courtlex/forms/case_form_page.dart';
import 'package:courtlex/models/case.dart';
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';

import 'home.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key, this.cases}) : super(key: key);
  final Cases? cases;

  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  static final List<Clients> _clients = [];
  final DatabaseService _databaseService = DatabaseService();
  Future<List<Cases>> _getCases() async {
    return await _databaseService.cases();
  }
  int _selectedClient = 0;
  late final Future? future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getClients();
  }
  Future<List<Clients>> _getClients() async {
    final clients = await _databaseService.clients();
    if (_clients.length == 0) _clients.addAll(clients);
    if (widget.cases != null) {
      _selectedClient =
          _clients.indexWhere((e) => e.id == widget.cases!.clientId);
    }
    return _clients.toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomePage(title: "Courtlex Tech Diary")),
              );
            },
          ),
          title: Text("Cases"),
        ),
         body: CaseBuilder(
        future: _getCases(),
      ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          /*FutureBuilder<List<Clients>>(
            future: _getClients(),
            builder: (context, snapshot) {
              //print(_getClients);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading clients...");
              }
             return AddCaseDetailsForm(
               clients: _clients.map((e) => e.name).toList(),
             );
            },
          ),*/
          FloatingActionButton(
            onPressed: () {
              //print( _clients.map((e) => e.id).toList());
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (_) => AddCaseDetailsForm(
                    clients: _clients.map((e) => e.name).toList(),
                  ),
                  fullscreenDialog: true,
                ),
              )
                  .then((_) => setState(() {}));
            },
            // heroTag: 'addBreed',
            child: FaIcon(FontAwesomeIcons.plus),
          ),
        ]));
  }
}
