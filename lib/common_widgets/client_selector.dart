import 'package:flutter/material.dart';

class ClientSelector extends StatelessWidget {
   ClientSelector({
    Key? key,
    required this.clients,
    //required this.selectedIndex,
   // required this.onChanged,
  }) : super(key: key);
  final List<String> clients;
  //final int selectedIndex;
  //final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: SingleChildScrollView(
            child: DropdownButtonFormField<String>(
              hint:Text(
                'Select Client',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              items: clients.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {

              },
            ),
          ),
          /* child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: clients.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                   onChanged(index);
                  // print(clients);
                },
                child: Container(
                  height: 40.0,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.only(right: 12.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 3.0,
                      color:
                          selectedIndex == index ? Colors.teal : Colors.black,
                    ),
                  ),
                  child: Text(clients[index]),
                ),
              );
            },
          ),*/
        ),
      ],
    );
  }
}
