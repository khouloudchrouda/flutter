


import 'package:flutter/material.dart';
import 'package:prianou_app/bottom_navigationbar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {


  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/logo-navbar.png'
            , color: Colors.cyan,),

        ),
      ),
    );
  }
  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Entrez votre nom',
            // icon: new Icon(
            //   Icons.mail,
            //   color: Colors.cyan,
            // )
            ),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }
  Widget showPrenomInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Entrez votre prenom',
          // icon: new Icon(
          //   Icons.mail,
          //   color: Colors.cyan,
          // )
        ),
        validator: (value) => value.isEmpty ? 'Prenom can\'t be empty' : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Entrez votre Email',
          // icon: new Icon(
          //   Icons.mail,
          //   color: Colors.cyan,
          // )
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Entrez votre Password',
            // icon: new Icon(
            //   Icons.lock,
            //   color: Colors.cyan,
            // )
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Password can\'t be empty'
            : null,
        //onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showconfirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Confirmez  Password',
          // icon: new Icon(
          //   Icons.lock,
          //   color: Colors.cyan,
          // )
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Password can\'t be empty'
            : null,
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
                side: BorderSide(color: Colors.grey)
            ),

            child: new Text("S'ENREGISTRER",
                style: new TextStyle(color: Colors.cyan, fontSize: 20.0)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigation()),
              );
            },
          ),
        ));
  }
  Widget showtextlogo() {
    return new FlatButton(
      child: new Text(
          'Prianou',
          style: new TextStyle(color: Colors.cyan,
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
                  showNameInput(),
                   showPrenomInput(),
                  showEmailInput(),
                  showPasswordInput(),
                  showconfirmPasswordInput(),
                  showPrimaryButton(),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top :30.0),
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'se connecter',
                        style: TextStyle(
                            color: Colors.black),
                      )),
                ),

              )
        ],
      ),
    )
    )]
    )
    );

  }

}
