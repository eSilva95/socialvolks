import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // final usuarioProvider = UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      )
    );
  }

  _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondo = Container(
      padding: EdgeInsets.all(40.0),
      child: Image.asset('assets/img/volkstoysfb.png'),
      height: size.height * 0.4,
      width: double.infinity
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Color.fromRGBO(63, 63, 156, 1.0),
      //       Color.fromRGBO(90, 70, 178, 1.0)
      //     ]
      //   )
      // ),
    );

    return fondo;
  }

  _loginForm(context) {

    final size = MediaQuery.of(context).size;
    // final bloc = Provider.of(context);



    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.15,
            )
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1.0),
                  Color.fromRGBO(255, 0, 0, 1.0),
                  Color.fromRGBO(255, 255, 0, 1.0)
                ]
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Bienvenido', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                SizedBox(height: 30.0,),
                _crearEmail(),
                SizedBox(height: 30.0,),
                _crearPassword(),
                SizedBox(height: 30.0,),
                _crearBoton(),
              ],
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'registro'), 
            child: Text('Registrarse')
          ),
          SizedBox(height: 80.0,)
        ],
      ),
    );
  }

  _crearEmail() {
    return StreamBuilder(
      // stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.yellow,
              primaryColorDark: Colors.yellow,
            ),
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.yellow),
                icon: Icon(Icons.email_outlined, color: Colors.yellow,),
                labelText: 'Correo',
                errorText: snapshot.error
              ),
              // onChanged: bloc.changeEmail,
            ),
          ),
        );  
      },
    );
  }

  _crearPassword() {
    return StreamBuilder(
      // stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.yellow,
              primaryColorDark: Colors.yellow
            ),
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.yellow,),
                labelStyle: TextStyle(color: Colors.yellow),
                labelText: 'Contraseña',
                errorText: snapshot.error
              ),
              // onChanged: bloc.changePass,
            ),
          ),
        );
      },
    );
  }

  _crearBoton() {
    return StreamBuilder(
      // stream:  bloc.formStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          color: Colors.black,
          textColor: Colors.white,
          onPressed: () => Navigator.pushReplacementNamed(context, 'home')//!snapshot.hasData ? null : () => _login(bloc, context)
        );
      },
    );
  }

  // _login(LoginBloc bloc, BuildContext context) async {
  //   Map info = await usuarioProvider.login(bloc.email, bloc.password);

  //   if (info['ok']) { 
  //     Navigator.pushReplacementNamed(context, 'home');
  //   } else {
  //     utils.mostrarAlerta(context, 'El usuario o contraseña son incorrectos');
  //   }
    // Navigator.pushReplacementNamed(context, 'home');
    // print('=====================');
    // print('Email: ${bloc.email}');
    // print('Contraseña: ${bloc.password}');
    // print('=====================');
  // }
}