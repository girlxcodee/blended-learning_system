import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../widgets/primary_button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  bool _notificationsEnabled = true;
  String _theme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Theme',
              ),
              value: _theme,
              onChanged: (value) {
                setState(() {
                  _theme = value!;
                });
              },
              items: ['light', 'dark', 'system']
                  .map((theme) => DropdownMenuItem(
                        value: theme,
                        child: Text(theme),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),

          GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteManager.settingsPage);
                  },
                  child: PrimaryButton(buttonText: 'Save'),
                ),
          ],
        ),
      ),
    );
  }
}
