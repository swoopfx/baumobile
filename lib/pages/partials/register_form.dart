// import 'package:bau/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';
import '../../pages/login.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  double _fieldMarginTop = 10;
  double _fieldMarginBottom = 0;
  double _fieldMarginLeft = 0;
  double _fieldMarginRight = 0;

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'fullname': '',
    'password': '',
    'email': '',
    'phoneNumber': '',
  };

  var _isLoading = false;
  final _passwordController = TextEditingController();

  void processRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState!.save();
    try {
      await Provider.of<Auth>(context, listen: false).register(
          phoneNumber: _authData["phoneNumber"].toString(),
          password: _authData["password"].toString(),
          email: _authData["email"].toString(),
          fullname: _authData["fullname"].toString());
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
      // showModal
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
                child: TextFormField(
                  onSaved: (newValue) {
                    _authData["fullname"] = newValue.toString();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Your Full Name is required";
                    }
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Full Name",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (newValue) {
                    _authData["email"] = newValue.toString();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Email",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return 'We don\'t think this phone number is valid ';
                    }
                  },
                  onSaved: (newValue) {
                    _authData["phoneNumber"] = newValue.toString();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Phone Number",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (newValue) {
                    _authData['password'] = newValue.toString();
                  },
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match!';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Confirm Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: Text(
                        "Register".toUpperCase(),
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
                      onPressed: () => processRegister()),
            )
          ],
        ));
  }
}
