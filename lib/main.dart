import 'package:flutter/material.dart';
import 'package:login_signup/login.dart';
import 'package:login_signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, _CreateRoute());
    });
  }

  Route _CreateRoute(){
    return (PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => loginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
  var begin = Offset(0.0, 1.0);
  var end = Offset.zero;
  var curve = Curves.ease;

  var tween = Tween(begin: begin, end: end);
  var curvedAnimation = CurvedAnimation(
   parent: animation,
   curve: curve,
  );

  return SlideTransition(
   position: tween.animate(curvedAnimation),
   child: child,
  );
}));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.orange[800], Colors.orange[400]])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("WELCOME",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white70,shadows: [Shadow(
                blurRadius: 50,color: Colors.white70
              )]),),
              Image.asset('images/img2.png')
            ],
          ),
        ) );
  }
}
