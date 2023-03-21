import 'package:courtlex/common_widgets/client_selector.dart';
import 'package:courtlex/pages/cases_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:courtlex/models/case.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:courtlex/models/clients.dart';

class AddCaseDetailsForm extends StatefulWidget {
  const AddCaseDetailsForm({Key? key, this.cases, this.clients})
      : super(key: key);
  final Cases? cases;
  final List<String>? clients;

  @override
  _AddCaseDetailsFormState createState() =>
      _AddCaseDetailsFormState(clients: clients);
}

class _AddCaseDetailsFormState extends State<AddCaseDetailsForm>
    with SingleTickerProviderStateMixin {

  late final _tabController = TabController(length: 4, vsync: this);
  bool priceupdate_value = false;
  final List<String> statusList = ["OPEN", "CLOSED"];

  // static final  List<Clients> _clients =[];
  List<String>? clients;

  _AddCaseDetailsFormState({this.clients});

  //case basic details controllers
  final TextEditingController _caseName = TextEditingController();
  final TextEditingController _caseNumber = TextEditingController();
  final TextEditingController _caseRemarks = TextEditingController();
  TextEditingController _datePicked = TextEditingController();

  //case details controllers
  final TextEditingController _caseType = TextEditingController();
  final TextEditingController _caseFees = TextEditingController();
  final TextEditingController _caseCharges = TextEditingController();
  TextEditingController _casePetitioner = TextEditingController();
  final TextEditingController _caseResponder = TextEditingController();
  TextEditingController _caseDescription = TextEditingController();

  //opponent details controllers
  TextEditingController _opponentName = TextEditingController();
  final TextEditingController _opponentLawyer = TextEditingController();
  TextEditingController _opponentContactNumber = TextEditingController();

  //court details controllers
  TextEditingController _courtName = TextEditingController();
  final TextEditingController _courtCity = TextEditingController();
  TextEditingController _judgeName = TextEditingController();
  TextEditingController _typedLawFirm = TextEditingController();

  String case_status = '';
  String selected_client = '';
  String clientLawyer = '';
  String selectedLawfirm = '';

  int client_id = 0;
  DateTime selectedDate = DateTime.now();
  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final status = case_status;
    final client_lawyer = clientLawyer;
    final clientID = client_id;
    final caseName = _caseName.text;
    final caseNumber = _caseNumber.text;
    final caseRemarks = _caseRemarks.text;
    final date = selectedDate.toString();

    final caseType = _caseType.text;
    final caseFee = _caseFees.text;
    final caseCharge = _caseCharges.text;
    final casePetitioner = _casePetitioner.text;
    final caseResponder = _caseResponder.text;
    final caseDescription = _caseDescription.text;

    final opponentName = _opponentName.text;
    final opponentLawyer = _opponentLawyer.text;
    final opponentContact = _opponentContactNumber.text;

    final courtName = _courtName.text;
    final courtCity = _courtCity.text;
    var firm;
    if (selectedLawfirm == "") {
      setState(() {
        firm = _typedLawFirm.text;
      });
    } else {
      setState(() {
        firm = selectedLawfirm;
      });
    }
    final judge = _judgeName.text;
    await _databaseService.insertCase(Cases(
        caseStatus: status,
        clientId: clientID,
        caseName: caseName,
        caseNumber: caseNumber,
        caseDate: date,
        caseRemarks: caseRemarks,
        caseType: caseType,
        caseFee: caseFee,
        caseCharges: caseCharge,
        casePetitioner: casePetitioner,
        caseResponder: caseResponder,
        caseDescription: caseDescription,
        opponentName: opponentName,
        opponentLawyer: opponentLawyer,
        opponentContact: opponentContact,
        courtName: courtName,
        lawyer: client_lawyer,
        lawFirm: firm,
        courtCity: courtCity,
        judgeName: judge));
    Navigator.pop(context);
  }

  /* Future<List<Clients>> _getClients() async {
    final clients = await _databaseService.clients();
    if (_clients.length == 0) _clients.addAll(clients);
    if (widget.cases != null) {
      _selectedClient = _clients.indexWhere((e) => e.id == widget.cases!.clientId);
    }
    return _clients.toList();
  }*/
  int _selectedClient = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _datePicked = new TextEditingController(
        text: selectedDate.toString().substring(0, 10));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        _datePicked.text = selected.toString().substring(0, 10);
      });
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
              MaterialPageRoute(builder: (context) => CasesPage()),
            );
          },
        ),
        title: Text('Add new Case'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          indicatorColor: Colors.white,
          tabs: [
            Row(
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Basic Details"),
                Text("--------"),
              ],
            ),
            Row(
              children: [
                Text("--------"),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Case Details"),
              ],
            ),
            Row(
              children: [
                Text("--------"),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  alignment: Alignment.center,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Opponent Details"),
              ],
            ),
            Row(
              children: [
                Text("--------"),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  alignment: Alignment.center,
                  child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("Court Details"),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.0),
                DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItems: true,
                  items: statusList,
                  label: "Select Case Status",
                  hint: "country in menu mode",
                  onChanged: (String? newValue) {
                    setState(() {
                      case_status = newValue!;
                    });
                  },
                  selectedItem: case_status,
                ),
                        SizedBox(height: 16.0),

                DropdownSearch<String>(
          maxHeight: 500,
          mode: Mode.MENU,
          showSelectedItems: true,
          items: clients!.toList(),
          //items: snapshot.data!.map((e) => e.name).toList(),
          label: "Select Client",
          hint: "country in menu mode",
          //popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: ( newValue) {
            setState(() {
              selected_client = newValue!;
              //_selectedClient=snapshot.data!.map((e) => e.name).toList().indexOf(newValue);
              _selectedClient = clients!.indexOf(newValue);
              print(_selectedClient);

            });
          },
          selectedItem: selected_client,
        ),
                SizedBox(height: 16.0),
                FutureBuilder<List<Clients>>(
                    //future: _getClients(),
                    builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading breeds...");
                  }
                  return DropdownSearch<String>(
                    maxHeight: 500,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: clients!.toList(),
                    //items: snapshot.data!.map((e) => e.name).toList(),
                    label: "Select Client",
                    hint: "country in menu mode",
                    //popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (newValue) {
                      setState(() {
                        selected_client = newValue!;
                        //_selectedClient=snapshot.data!.map((e) => e.name).toList().indexOf(newValue);
                        _selectedClient = clients!.indexOf(newValue) + 1;
                        print(_selectedClient);
                      });
                    },
                    selectedItem: selected_client,
                  );
                }),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Number',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  readOnly: true,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                  },
                  controller: _datePicked,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Date',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseRemarks,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Remarks',
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 1;
                      },
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ],
                )
                /*  SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text(
                      'Save the Client',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _caseType,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Type',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseFees,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Fees',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseCharges,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Charges',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _casePetitioner,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Petitioner',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseResponder,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Responder',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _caseDescription,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Case Description',
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 0;
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 2;
                      },
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ],
                )
                /*  SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text(
                      'Save the Client',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.0),
                TextField(
                  controller: _opponentName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Opponent Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _opponentLawyer,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Opponent Lawyer',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _opponentContactNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Opponent Contact Number',
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 1;
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 3;
                      },
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ],
                )
                /*  SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text(
                      'Save the Client',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _courtName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Court Name',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _courtCity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Court City',
                  ),
                ),
                SizedBox(height: 16.0),
              /*  DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItems: true,
                  items: lawyersList,
                  label: "Select Lawyer",
                  hint: "country in menu mode",
                  //popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: (String? newValue) {
                    setState(() {
                      clientLawyer = newValue!;
                    });
                  },
                  selectedItem: clientLawyer,
                ),
                SizedBox(height: 16.0),
                if (priceupdate_value == false)
                  DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: lawfirmList,
                    label: "Select LawFirm",
                    hint: "country in menu mode",
                    dropdownBuilderSupportsNullItem: true,
                    //popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLawfirm = newValue!;
                      });
                    },
                    selectedItem: selectedLawfirm,
                  ),
                SizedBox(height: 16.0),*/
                CheckboxListTile(
                  title: Text("No Lawfirm found ?"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: priceupdate_value,
                  onChanged: (bool? priceupdateValue) {
                    setState(() {
                      priceupdate_value = priceupdateValue!;
                      selectedLawfirm = "";
                    });
                  },
                ),
                if (priceupdate_value)
                  TextField(
                    controller: _typedLawFirm,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Law Firm',
                    ),
                  ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _judgeName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Judge Name',
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _tabController.index = 2;
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: _onSave,
                      child: Row(
                        children: [
                          Text(
                            'Complete',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.done)
                        ],
                      ),
                    ),
                  ],
                )
                /*  SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text(
                      'Save the Client',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
