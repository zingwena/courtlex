import 'package:flutter/material.dart';
import 'package:courtlex/common_widgets/dog_builder.dart';
import 'package:courtlex/models/clients.dart';
import 'package:courtlex/models/dog.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'clients_page.dart';
import '../forms/dog_form_page.dart';

class ClientDetailsPage extends StatefulWidget {
  final String client_name;
  final String client_address;
  final String client_city;
  final String client_email;
  final String client_phone;
  final String client_remarks;
  final Clients client;

  ClientDetailsPage(
      {required this.client_name,
      required this.client_address,
      required this.client_city,
      required this.client_email,
      required this.client_phone,
      required this.client_remarks,
      required this.client});

  @override
  _ClientDetailsPageState createState() => _ClientDetailsPageState(
      client_name: client_name,
      client_address: client_address,
      client_city: client_city,
      client_email: client_email,
      client_phone: client_phone,
      client_remarks: client_remarks,
      client: client);
}

class _ClientDetailsPageState extends State<ClientDetailsPage>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 4, vsync: this);

  final DatabaseService _databaseService = DatabaseService();
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _remarks = TextEditingController();

  final Clients client;
  late String client_name;
  late String client_address;
  late String client_city;
  late String client_email;
  late String client_phone;
  late String client_remarks;

  _ClientDetailsPageState({
    required this.client_name,
    required this.client,
    required this.client_address,
    required this.client_city,
    required this.client_email,
    required this.client_phone,
    required this.client_remarks,
  });

  @override
  void initState() {
    super.initState();
    _name = new TextEditingController(text: client_name);
    _address = new TextEditingController(text: client_address);
    _city = new TextEditingController(text: client_city);
    _email = new TextEditingController(text: client_email);
    _phone = new TextEditingController(text: client_phone);
    _remarks = new TextEditingController(text: client_remarks);
  }

  Future<List<Dog>> _getDogs() async {
    return await _databaseService.dogs();
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _onDogDelete(Dog dog) async {
    await _databaseService.deleteDog(dog.id!);
    setState(() {});
  }

  Future<void> _onClientDelete(Clients client) async {
    await _databaseService.deleteClient(client.id!);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Client Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  InkWell(child: Icon(Icons.share_outlined), onTap: () {}),
                  SizedBox(
                    width: 20.0,
                  ),
                  InkWell(child: Icon(Icons.edit), onTap: () {}),
                  SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                      child: Icon(Icons.delete),
                      onTap: () {
                        showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            insetPadding: EdgeInsets.all(10),
                            content: const Text(
                                'This will delete all Cases, Schedules, Evidences and'
                                ' Notes Associated with the client'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _onClientDelete(client);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ClientsList()),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }),

                ],
              ),
              SizedBox(
                height: 15,
              ),

              Column(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  /*Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),*/
                  child: Text(
                      client_name.toString().substring(0, 1).toUpperCase()),
                ),
                Text(client_name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              ],)
            ],
          )
        ],
        toolbarHeight: 200,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.white.withOpacity(0.6),
          indicatorColor: Colors.red,
          tabs: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('BASIC DETAILS'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('CASES'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('SCHEDULE'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('NOTES'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            padding: new EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Client Name ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _address,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Client Address ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _city,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Client City ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: _phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            //hintText: 'Case Remarks',
                            labelText: 'Phone Number ',
                          ),
                        ),
                      ),
                      Container(
                        height: 55.0,
                        child: ElevatedButton(
                          child: new Text('Call'),
                          onPressed: () async {
                            setState(() {
                              _openUrl('tel:${client_phone}');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: _email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            //hintText: 'Case Remarks',
                            labelText: 'Email ',
                          ),
                        ),
                      ),
                      Container(
                        height: 55.0,
                        child: ElevatedButton(
                          child: new Text('Email'),
                          onPressed: () async {
                            setState(() {
                              _openUrl('mailto:${client_email}');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _remarks,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Remarks ',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text("Nothing to display yet"),
          ),
          Center(
            child: Text("Nothing to display yet"),
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
          /* Center(
            child: Text("Nothing to display yet"),
          ),*/
          /*
          ClientBuilder(
            future: _getClients(),
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
    );
  }
}
