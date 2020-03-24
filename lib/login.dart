import 'package:flutter/cupertino.dart';
import 'package:login_signup/signup.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Colors.orange[800], Colors.orange[400]])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Login",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Welcome Back...",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white60),
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'images/img2.png',
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange[200], Colors.white]),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30, right: 30),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    //boxShadow: [BoxShadow(blurRadius: 5,color: Colors.black)]
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter the email ID",
                                      icon: Icon(Icons.person),
                                    ),
                                    validator: (val) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(val))
                                        return 'Enter Valid Email';
                                      else
                                        return null;
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30, right: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // boxShadow: [BoxShadow(blurRadius: 15,color: Colors.blue)]
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        labelText: "Enter the password"),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 200),
                                    child: Text("\nForgot Pasword ?\n\n")),
                                GestureDetector(
                                  onTap: () {
                                    formkey.currentState.validate()
                                        ? Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text('Login Successfully'),duration: Duration(seconds: 3),backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(30))),
                                          ))
                                        : Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text('Login Failed'),duration: Duration(seconds: 3),backgroundColor: Colors.orangeAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(30))),
                                          ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 46,
                                    width: 170,
                                    //padding: EdgeInsets.only(top: 10, left: 60),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.orange[800],
                                          Colors.orange[400]
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text("Login"),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text("\nContinue with social media\n")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 150,
                              //padding: EdgeInsets.only(top: 10, left: 60),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.blue[800],
                                    Colors.blue[400]
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 150,
                              //padding: EdgeInsets.only(top: 10, left: 60),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.black45, Colors.black]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Github",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return SignupPage();
                            }));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 44),
                            child: Text(
                              "Don't have account ? Register",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
