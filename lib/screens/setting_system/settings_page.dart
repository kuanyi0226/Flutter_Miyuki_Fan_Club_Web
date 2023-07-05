import 'package:flutter/material.dart';
import '../../class/official/updateInfo.dart';
import '../../screens/setting_system/about_app_page.dart';
import '../../screens/setting_system/copyright_page.dart';
import '../../screens/setting_system/privacy_policy_page.dart';

import '../../screens/auth_system/forgot_password_page.dart';
import '../../services/official_service.dart';
import './profile_page.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UpdateInfo? updateInfo;
  _SettingsPageState() {
    _getInfo();
  }

  Future _getInfo() async {
    updateInfo = await OfficialService.getUpdateInfo();
    print('latest version is: ${updateInfo!.version}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'Account',
                style: TextStyle(fontSize: 22),
              ),
            ),
            //Account
            Card(
              child: Column(children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage())),
                  child: ListTile(
                    title: Text(
                      'プロフィール Profile',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForGotPasswordPage())),
                  child: ListTile(
                    title: Text(
                      'パスワード忘れる Forgot Password',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ]),
            ),
            //More info
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                'More Info & Support',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Card(
              child: Column(children: [
                //About App
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutAppPage())),
                  child: ListTile(
                    title: Text(
                      '基本データ About App',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PrivacyPolicyPage())),
                  child: ListTile(
                    title: Text(
                      'プライバシーポリシー Privacy Policy',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                //Copyright
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CopyrightPage())),
                  child: ListTile(
                    title: Text(
                      '著作権 Copyright',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
