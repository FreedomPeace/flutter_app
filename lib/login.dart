import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
//void main() {
//  runApp(Login());
//}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(title: '登陆页面'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextField username = TextField(
      controller: usernameController,
      maxLength: 6,
      maxLines: 1,
      //是否自动更正
      autocorrect: true,
      textAlign: TextAlign.center,
      //对齐方式
      style: TextStyle(fontSize: 26.0, color: Colors.lightBlue),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          //添加灰色填充色
          filled: true,
          //是否填充
          helperText: "用户名",
          prefixIcon: Icon(Icons.person),
          //左侧图标
          suffixText: "用户名" //右侧文本提示
          ),
    );
    TextField password = TextField(
      controller: passwordController,
      maxLines: 1,
      //是否是密码
      obscureText: true,
      textAlign: TextAlign.center,
      //对齐方式
      style: TextStyle(fontSize: 26.0, color: Colors.lightBlue),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          //添加灰色填充色
          filled: true,
          //是否填充
          helperText: "密码",
          prefixIcon: Icon(Icons.person),
          //左侧图标
          suffixText: "密码" //右侧文本提示
          ),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyLoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
        children: <Widget>[
          Image.asset("assets/diamond.png"),
          Column(
            children: <Widget>[
              username,
              SizedBox(
                height: 20,
              ),
              password,
            ],
          ),
          ButtonBar(children: <Widget>[
            FlatButton(
              onPressed: () {
                usernameController.clear();
                passwordController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(width: 20,),
            RaisedButton(

              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyApp();
                }));
              },
              child: const Text('Next',
                  style: TextStyle(fontSize: 20,color: Colors.lightBlue)),
            )
          ],)
        ],
      )),
    );
  }
}
