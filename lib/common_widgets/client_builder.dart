import 'package:courtlex/models/clients.dart';
import 'package:courtlex/pages/client_details.dart';
import 'package:flutter/material.dart';

class ClientBuilder extends StatelessWidget {
  const ClientBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Clients>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Clients>>(
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
              final breed = snapshot.data![index];
              return _buildClientCard(breed, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildClientCard(Clients clients, BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ClientDetailsPage()),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                alignment: Alignment.center,
                child: Text(
                  clients.id.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clients.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(clients.address),
                    SizedBox(height: 4.0),
                    Text(clients.city),
                    SizedBox(height: 4.0),
                    Text(clients.phone),
                    SizedBox(height: 4.0),
                    Text(clients.email),
                    SizedBox(height: 4.0),
                    Text(clients.remarks),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
