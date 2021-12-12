import 'package:flutter/material.dart';
import '../register.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();

  Map<String, String> _authData = {
    "email": "",
    "password": "",
  };

  var _isLoading = false;

  void processLogin() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _form.currentState!.save();
    try {
      await Provider.of<Auth>(context, listen: false).login(
          _authData["email"].toString(), _authData["password"].toString());
    } catch (e) {
      print(e);
      return showDialog<Null>(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Error Occured"),
                content: Text(e.toString()),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _isLoading = false;
                      },
                      child: Text("OK"))
                ],
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _form,
        child: Column(
          children: [
            Container(
                child: TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Email or Phone number is required";
                    }
                  },
                  onSaved: (newValue) {
                    _authData["email"] = newValue.toString();
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type in your Email",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Password is required";
                    }
                  },
                  onSaved: (newValue) {
                    _authData["password"] = newValue.toString();
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type in your Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
              margin: EdgeInsets.all(10),
              child:
                  TextButton(onPressed: () {}, child: Text("Forgot Password")),
            ),
            Container(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      child: Text(
                        "Login".toUpperCase(),
                      ),
                      style: ButtonStyle(
                          // fixedSize: const Size.fromWidth(240),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () => processLogin()),
            ),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RegisterUser.routeName),
                    child: Text("Sign Up"))),
          ],
        ));
  }
}
