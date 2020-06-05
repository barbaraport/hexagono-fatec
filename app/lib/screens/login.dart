import 'package:flutter/material.dart';
import 'package:app/screens/HomePage.dart';
import 'package:app/utilities/selectLanguage.dart';
import 'package:app/utilities/api/sign-in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Widget _buildLoginGoogleBtn() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete((){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Homepage();
              }
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      highlightElevation: 0,
      borderSide: BorderSide(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image(image: AssetImage('assets/google_logo.png'), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter, 
              colors: [
                Color(0xFF000000),
                Color(0xFF000000),
                Color(0xDD000000),              
              ],
              stops: [0.1, 0.5, 0.9],
            )),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text(
                  //   AppLocalizations.of(context).translate('Sign in'),
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: 'OpenSans',
                  //     fontSize: 40.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  //Image(image: AssetImage('assets/app_logo.png'), height: 100, width: 100),
                  SizedBox(height: 30.0),
                  _buildLoginGoogleBtn(),
                  selectLanguage(),

                ],
              ),
            ),
          ),
        ],
      ),
   );
  }
}