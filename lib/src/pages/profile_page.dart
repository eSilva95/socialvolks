import 'package:flutter/material.dart';
import 'package:socialvolks/src/widgets/profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: SideMenu(),
      body: Profile()
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 10.0,
      leading: Container(
      margin: EdgeInsets.only(left: 15.0),
      child: Image.asset(
          'assets/img/volkstoysfb.png', 
          fit: BoxFit.contain
        )
      ),
      title: Text('Username'),
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.7,
      child: Drawer(
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 20.0, bottom: 10.0) ,child: Center(child: Text('Username'),)),
            Divider(),
            ListTile(
              title: Text('Configuración'), 
              leading: Icon(Icons.settings),
              onTap: (){},
            ),
            ListTile(
              title: Text('Cerrar Sesión'), 
              leading: Icon(Icons.logout),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
    );
  }
}