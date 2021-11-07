import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mailboxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginScreen(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const LoginScreen(),
        '/errorscreen': (context) => const ErrorScreen(),
        '/successedscreen': (context) => const SuccessedScreen(),
        '/mailboxscreen': (context) => const MailBoxScreen(),
      },
    );
  }
}

//Long
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('images/background.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.darken))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'images/CATLOGO1.png',
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  hintText: 'Email',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.lightGreen),
                  prefixIcon: Icon(
                    Icons.email_sharp,
                    color: Colors.black,
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            TextField(
                controller: _password,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ))),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 250,
              child: OutlinedButton(
                onPressed: () {
                  if (_email.text == _password.text) {
                    Navigator.pushNamed(context, '/successedscreen');
                    Timer(Duration(seconds: 3), () {
                      Navigator.pushNamed(context, '/mailboxscreen');
                    });
                  } else if (_email.text == '' || _password.text == '') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Thông Báo'),
                        content: Text('Email hoặc Password đang bị thiếu'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tắt'),
                          ),
                        ],
                      ),
                    );
                  } else if (_email.text != _password.text) {
                    Navigator.pushNamed(context, '/errorscreen');
                  }
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'images/error.png',
                width: 100,
                height: 100,
              ),
              Text(
                'Oops...không thể đăng nhập',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text('Email với mật khẩu bị sai!',
                  style: TextStyle(fontSize: 16.0, color: Colors.black)),
              Text('Vui lòng thử lại!',
                  style: TextStyle(fontSize: 16.0, color: Colors.black)),
              SizedBox(
                height: 70,
              ),
              Container(
                width: 250,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, '/home');
                  },
                  child: Text(
                    "Thử lại",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade300),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessedScreen extends StatefulWidget {
  const SuccessedScreen({Key? key}) : super(key: key);

  @override
  State<SuccessedScreen> createState() => _SuccessedScreenState();
}

class _SuccessedScreenState extends State<SuccessedScreen> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('images/background.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.darken))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(child: Image.network('images/CATLOGO1.PNG')),
                SizedBox(
                  height: 200,
                ),
                Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ])),
    );
  }
}
