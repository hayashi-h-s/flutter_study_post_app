import 'package:flutter/material.dart';

class SideMenuDrawerExampleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SideMenuDrawerExampleScreen> {
  var _city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Drawer Test'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'My App',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Los Angeles'),
                onTap: () {
                  setState(() => _city = 'Los Angeles, CA');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Honolulu'),
                onTap: () {
                  setState(() => _city = 'Honolulu, HI');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Dallas'),
                onTap: () {
                  setState(() => _city = 'Dallas, TX');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Seattle'),
                onTap: () {
                  setState(() => _city = 'Seattle, WA');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tokyo'),
                onTap: () {
                  setState(() => _city = 'Tokyo, Japan');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            _city,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ));
  }
}
