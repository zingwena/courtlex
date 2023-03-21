import 'package:courtlex/models/case.dart';
import 'package:courtlex/pages/case_details.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:flutter/material.dart';

class CaseBuilder extends StatelessWidget {
  const CaseBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Cases>> future;

  Future<String> getClientName(int id) async {
    final DatabaseService _databaseService = DatabaseService();
    final clients = await _databaseService.client(id);
    return clients.name;
  }

  Future<String> getClientCity(int id) async {
    final DatabaseService _databaseService = DatabaseService();
    final clients = await _databaseService.client(id);
    return clients.city;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cases>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cases = snapshot.data![index];
            //  print(cases);

              return _buildCaseCard(cases, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildCaseCard(Cases cases, BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          //padding: const EdgeInsets.all(12.0),
          child: ListTile(
        isThreeLine: true,
        title: Row(
          children: [
            Flexible(
              child: Text(
                cases.caseName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '(${cases.courtCity})',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            FutureBuilder<String>(
              future: getClientName(cases.clientId),
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            FutureBuilder<String>(
              future: getClientCity(cases.clientId),
              builder: (context, snapshot) {
                return Text('(${snapshot.data})');
              },
            ),
          ],
        ),
        trailing: Column(
          children: [
            Container(
              height: 20,
              width: 100.0,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cases.caseDate.toString().substring(0, 10),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
              width: 100.0,
              color: cases.caseStatus == "OPEN" ? Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cases.caseStatus,
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
        onTap: () async {
          print(cases.clientId);
          final String clientname = await getClientName(cases.clientId);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CaseDetails(
                    caseName: cases.caseName,
                    caseDate: cases.caseDate,
                    caseStatus: cases.caseStatus,
                    clientName: clientname,
                    caseNumber: cases.caseNumber,
                    caseRemarks: cases.caseRemarks,
                    courtName: cases.courtName,
                    courtCity: cases.courtCity,
                    judgeNme: cases.judgeName)),
          );
        },
      )),
    );
  }
}
