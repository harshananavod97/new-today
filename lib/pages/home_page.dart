import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_tutorial_app/pages/ElectionVotepage.dart';

class HomePage extends StatefulWidget {
  String Id;
  HomePage({super.key, required this.Id});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalAuthentication _auth = LocalAuthentication();

  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Methana  Hadapan
            Text("me udaxxx\ngdgdgdg"),
            /////////////////////////////////////////////////////////
            SizedBox(height: MediaQuery.of(context).size.width / 2),
            Center(child: _authButton()),
          ],
        ),
      ),
    );
  }

  Widget _authButton() {
    return Container(
      height: 100,
      width: 100,
      child: ElevatedButton(
        onPressed: () async {
          if (!_isAuthenticated) {
            final bool canAuthenticateWithBiometrics =
                await _auth.canCheckBiometrics;
            if (canAuthenticateWithBiometrics) {
              try {
                final bool didAuthenticate = await _auth.authenticate(
                  localizedReason:
                      'Please authenticate to show account balance',
                  options: const AuthenticationOptions(
                    biometricOnly: false,
                  ),
                );
                setState(() {
                  _isAuthenticated = didAuthenticate;
                });
              } catch (e) {
                print(e);
              }
            }
          } else {
            setState(() {
              _isAuthenticated = false;
            });
          }

          if (_isAuthenticated) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElectionVotePage(title: widget.Id),
                ));
          }
        },
        child: Icon(
          _isAuthenticated ? Icons.fingerprint : Icons.fingerprint,
          size: 40,
        ),
      ),
    );
  }
}
