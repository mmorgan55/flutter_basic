import 'package:flutter/material.dart';
import 'settings.dart';
import 'login.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatefulWidget {
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  String _title = 'Please login';
  Widget _screen;
  Login _login;
  Settings _settings;
  bool _authenticated ;

  _LoginAppState() {
    _login = Login(onSubmit: () {
      _onSubmit();
    });
    _settings = Settings();
    _screen = _login;
    _authenticated = false;
  }

  void _onSubmit() {
    print('Login with: ${_login.username} ${_login.password}');
    if (_login.username == 'user' && _login.password == 'password') {
      _setAuthenticated(true);
    }
  }

  void _goHome() {
    print('Go Home');
    setState(() {
      if (_authenticated == true) {
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = true;
      } else {
        _screen = _login;
        _title = 'Please Login';
        _authenticated = false;
      }
    });
  }

  void _logOut() {
    print('Log Out');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if(auth == true) {
        _screen = _settings;
        _title = 'Welcome';
      } else {
        _screen = _login;
        _title = 'Please Login';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: _goHome,
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _logOut,
            )
          ],
        ),
        body: _screen,
      ),
    );
  }
}
