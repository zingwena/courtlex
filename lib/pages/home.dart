import 'package:courtlex/pages/cases_page.dart';
import 'package:courtlex/pages/clients_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 25.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Courtlex Diary Features",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ClientsList()),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.red,
                            ),
                            Text(
                              "Clients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CasesPage()),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.note_sharp,
                              color: Colors.indigo,
                            ),
                            Text(
                              "Cases",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("yes clicked");
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              "Schedule",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint("yes ");
                    },
                    splashColor: Colors.blueGrey,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fingerprint),
                            Text(
                              "Evidence",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.note,
                              color: Colors.red,
                            ),
                            Text(
                              "Notes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.indigo,
                            ),
                            Text(
                              "Calender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint("yes ");
                    },
                    splashColor: Colors.blueGrey,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status Overview",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 30.0),
                            ),
                            Text(
                              "Open",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            Text(
                              "Cases",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 30.0),
                            ),
                            Text(
                              "Schedule",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            Text(
                              "Today",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("yes ");
                    },
                    splashColor: Colors.blueGrey,
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 30.0),
                            ),
                            Text(
                              "Clients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Added",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("yes");
                    },
                    splashColor: Colors.blueGrey,
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      child: Card(
                        semanticContainer: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 30.0),
                            ),
                            Text(
                              "Cases",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              "Added",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey.shade200,
          //other styles
        ),
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Warren Zingwena"),
                  accountEmail: Text("warrenzingwena@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Search",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.people_alt,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Clients",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.schedule,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Schedule",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.cases,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Cases",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.notes,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Notes",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                Divider(color: Colors.black87),
                ListTile(
                  title: Text(
                    "Other Information",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade800,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Share App",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call,color: Colors.grey,),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule,color: Colors.grey),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: Colors.grey),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
