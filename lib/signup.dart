import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();
  final tb1 = TextEditingController();
  final tb2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
                  builder: (context){ return Container(
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
                            "Sign Up",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Welcome ...",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white60),
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'images/img2.png',
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
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
                                    validator: (val) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(val))
                                        return 'Enter Valid Email';
                                      else
                                        return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Enter the email ID",
                                      icon: Icon(Icons.person),
                                    ),
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
                                    validator: (val) {
                                      if (val.length != 10) {
                                        return "enter the valid mobile no";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.phone),
                                        labelText: "Enter the Mobile no"),
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
                                    controller: tb1,
                                    validator: (val) {
                                      if (val.length < 5) {
                                        return "please input the password more than 5 character";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        labelText: "Enter the password"),
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
                                    controller: tb2,
                                    validator: (val) {
                                      if (val.length < 5) {
                                        return "please input the password more than 5 character";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        helperText: 'please input the password more than 5 character',
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        labelText: "Confirm password"),
                                        
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    bool ans1 = formkey.currentState.validate();
                                    bool ans2 = tb1.text == tb2.text;
                                    if (ans1 == true && ans2 == true) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text('Registered Successfully'),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(30))),
                                      ));
                                      Navigator.pop(context);
                                    } else if(ans1==false && ans2==false){
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          'Please enter the detail properly'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(30))),
                                    ));
                                    }
                                    else if(ans2==false){
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'Password does not match'),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(30))),
                                      ));
                                    }
                                    else if(ans1 == false){
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'Invalid Detail'),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(30))),
                                      ));
                                    }
                                    else{
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          'Registered Successfully'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(30))),
                                    ));
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 46,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 30),
                                    //padding: EdgeInsets.only(top: 10, left: 60),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.orange[800],
                                          Colors.orange[400]
                                        ]),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Text("Sign Up"),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 44),
                            child: Text(
                              "Already have member ? Login",
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
          );}
        ));
  }
}
