import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (BuildContext context, Widget child, UserModel model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  validator: (text) {
                    if (text.isEmpty) return "Nome inválido";
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Nome completo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "E-mail inválido";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passController,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha inválida";
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _addressController,
                  validator: (text) {
                    if (text.isEmpty) return "Endereço inválida";
                  },
                  decoration: InputDecoration(
                      hintText: "Endereço",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text
                        };

                        model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSuccess: _onSucess,
                            onError: _onError);
                      }
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSucess() {}

  void _onError() {}
}
