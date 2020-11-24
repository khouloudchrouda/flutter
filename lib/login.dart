import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prianou_app/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Widget showLogo() {
      return new Hero(
        tag: 'hero',
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
          child: Image.asset(
            'assets/images/logo-navbar.png',
            color: Colors.cyan,
            height: 70,
          ),
        ),
      );
    }

    Widget showEmailInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Email',
              icon: new Icon(
                Icons.mail,
                color: Colors.cyan,
              )),
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          //onSaved: (value) => _email = value.trim(),
        ),
      );
    }

    Widget showPasswordInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Password',
              icon: new Icon(
                Icons.lock,
                color: Colors.cyan,
              )),
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          //onSaved: (value) => _password = value.trim(),
        ),
      );
    }

    Widget showPrimaryButton() {
      return new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
          child: SizedBox(
            height: 40.0,
            child: new RaisedButton(
              color: Colors.white,
              disabledColor: Colors.white,
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.grey)),
              child: new Text('Login',
                  style: new TextStyle(color: Colors.cyan, fontSize: 20.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            ),
          ));
    }

    Widget showSecondaryButton() {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Expanded(child: new Text(
            //     'mot de  passe oubliè?',
            //     style: new TextStyle(color: Colors.black,
            //         fontSize: 16.0,
            //         fontWeight: FontWeight.w400)),
            // ),
            // Expanded(child: new Text(
            //     "s'inscrire",
            //
            //     style: new TextStyle(color: Colors.black,
            //         fontSize: 16.0,
            //         fontWeight: FontWeight.w400)),
            // ),
          ],
        ),
      );
    }

    Widget showtextlogo() {
      return new FlatButton(
        child: new Text('Prianou',
            style: new TextStyle(
                color: Colors.cyan,
                fontSize: 20.0,
                fontWeight: FontWeight.w500)),
      );
    }

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40.0),
            child: new Form(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  showLogo(),
                  showtextlogo(),
                  showEmailInput(),
                  showPasswordInput(),
                  showSecondaryButton(),
                  showPrimaryButton(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      Text("OR"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: new IconButton(
                            icon: FaIcon(FontAwesomeIcons.facebookSquare,
                                color: Colors.blueAccent, size: 50.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: new IconButton(
                            icon: FaIcon(FontAwesomeIcons.googlePlus,
                                color: Colors.deepOrange, size: 50.0),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
