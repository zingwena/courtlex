import 'package:courtlex/models/case.dart';
import 'package:courtlex/services/database_service.dart';
import 'package:flutter/material.dart';

class CaseBuilder extends StatelessWidget {
  const CaseBuilder({Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Cases>> future;

  Future<String> getClientName(int id) async {
    final DatabaseService _databaseService = DatabaseService();
    final clients = await _databaseService.client(id);
    return clients.name;
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
              return _buildCaseCard(cases, context);
            },
          ),
        );
      },
    );
  }


  Widget _buildCaseCard(Cases cases, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cases.caseName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future: getClientName(cases.clientId),
                    builder: (context, snapshot) {
                      return Text('Client: ${snapshot.data}');

                    },
                  ),
                  SizedBox(height: 4.0),
                ],
              ),
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}
