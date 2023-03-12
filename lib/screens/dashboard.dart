import 'package:blended_learning_system/routes/routes.dart';
import 'package:blended_learning_system/screens/profile.dart';
import 'package:blended_learning_system/screens/results.dart';
import 'package:blended_learning_system/screens/settings_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text(
            'Student Dashboard',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.white,
      drawer: new Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: new Text(
                'Mpho Letshwenyo',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text('admin@admin.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.etsy.com/dk-en/listing/708794831/formats-svg-png-pdf-black-woman-graduate"),
              ),
              decoration: new BoxDecoration(color: Colors.blueGrey),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Password"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Info"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Homepage"),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            MyMenu(
              title: 'Profile',
              icon: Icons.person_pin,
              warna: Colors.blueGrey,
            ),
            MyMenu(
              title: 'Settings',
              icon: Icons.settings,
              warna: Colors.blue,
            ),
            MyMenu(
              title: 'Grade Material',
              icon: Icons.local_library,
              warna: Colors.yellow,
            ),
            MyMenu(
              title: 'Timetable',
              icon: Icons.calendar_today,
              warna: Colors.teal,
            ),
            MyMenu(
              title: 'Class Session',
              icon: Icons.video_call,
              warna: Colors.red,
            ),
            MyMenu(
              title: 'Assesments',
              icon: Icons.lock_clock,
              warna: Colors.brown,
            ),
            MyMenu(
              title: 'Annoucement Page',
              icon: Icons.announcement,
              warna: Colors.blue,
            ),
            MyMenu(
              title: 'My Grades',
              icon: Icons.school,
              warna: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({
    required this.title,
    required this.icon,
    required this.warna,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              if(title == 'Profile')
              {
                Navigator.of(context).pushNamed(RouteManager.myProfilePage);
              }
              else if(title == 'My Grades') {
                Navigator.of(context).pushNamed(RouteManager.resultScreen);
              }
              else if(title == 'Assesments')
              {
                Navigator.of(context).pushNamed(RouteManager.assignmentPage);
              }
              else if(title == 'Settings')
              {
                 Navigator.of(context).pushNamed(RouteManager.settingsPage);
              }
              
            },
            
            splashColor: Colors.grey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 70.0,
                    color: warna,
                  ),
                  Text(title,
                      style: new TextStyle(
                        fontSize: 17.0,
                      ))
                ],
              ),
            )));
  }
}
