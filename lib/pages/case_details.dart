import 'package:flutter/material.dart';

class CaseDetails extends StatefulWidget {
  final String caseName;
  final String caseDate;
  final String caseStatus;
  final String clientName;
  final String caseNumber;
  final String caseRemarks;
  final String courtName;
  final String courtCity;
  final String judgeNme;

  CaseDetails({
    required this.caseName,
    required this.caseDate,
    required this.caseStatus,
    required this.clientName,
    required this.caseNumber,
    required this.caseRemarks,
    required this.courtName,
    required this.courtCity,
    required this.judgeNme,
  });

  @override
  _CaseDetailsState createState() => _CaseDetailsState(
        case_name: caseName,
        case_date: caseDate,
        case_status: caseStatus,
        client_name: clientName,
        case_number: caseNumber,
        case_remarks: caseRemarks,
        court_name: courtName,
        court_city: courtCity,
        judge_name: judgeNme,
      );
}

class _CaseDetailsState extends State<CaseDetails>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 5, vsync: this);

  TextEditingController _caseName = TextEditingController();
  TextEditingController _caseDate = TextEditingController();
  TextEditingController _caseNumber = TextEditingController();
  TextEditingController _caseRemarks = TextEditingController();
  TextEditingController _courtName = TextEditingController();
  TextEditingController _courtCity = TextEditingController();
  TextEditingController _judgeName = TextEditingController();
  TextEditingController _clientName = TextEditingController();
  late String case_name;
  late String case_date;
  late String case_status;
  late String client_name;
  late String case_number;
  late String case_remarks;
  late String court_name;
  late String court_city;
  late String judge_name;


  _CaseDetailsState({
    required this.case_name,
    required this.case_date,
    required this.case_status,
    required this.client_name,
    required this.case_number,
    required this.case_remarks,
    required this.court_name,
    required this.court_city,
    required this.judge_name,

  });
  @override
  void initState() {
    super.initState();
    _caseName = new TextEditingController(text: case_name);
    _caseDate = new TextEditingController(text: case_date);
    _caseNumber = new TextEditingController(text: case_number);
    _caseRemarks = new TextEditingController(text: case_remarks);
    _courtName = new TextEditingController(text: court_name);
    _courtCity = new TextEditingController(text: court_city);
    _judgeName = new TextEditingController(text: judge_name);
    _clientName = new TextEditingController(text: client_name);
  }

  @override
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
                    'Case Details',
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
                                  /*   _onClientDelete(client);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ClientsList()),*/
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 0.0),
                      child: Icon(
                        Icons.event_note_sharp,
                        size: 50,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(case_name,
                              style: TextStyle(fontSize: 20),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          client_name,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          case_date.toString().substring(0, 10),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          width: 100.0,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "OPEN",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 100.0,
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CLOSE",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
        toolbarHeight: 180,
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
              child: Text('CASE DETAILS'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('EVIDENCES'),
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
                    controller: _caseName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Case Name ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _clientName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Client NAme ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _caseNumber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Case Number ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _caseDate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Case Date ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _caseRemarks,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Case Remarks ',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _courtName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Court Name ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _courtCity,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Court City ',
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    readOnly: true,
                    controller: _judgeName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Case Remarks',
                      labelText: 'Judge Name',
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
          Center(
            child: Text("Nothing to display yet"),
          ),
          Center(
            child: Text("Nothing to display yet"),
          ),
        ],
      ),
    );
  }
}
