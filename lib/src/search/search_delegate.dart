import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';

  final users = [
    'Eduardo Luis Silva Camacho',
    'Guillermo Reyes',
    'Genaro Yair Enciso',
    'Rodrigo Serrano',
    'Noé Navarro',
    'Julio Cesar Valencia'
  ];

  final lastUsers =[
    'Eduardo Luis Silva Camacho',
    'Guillermo reyes'
  ] ;

  @override
   ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear ), 
          onPressed: (){
            query = '';
          }
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, 
          progress: transitionAnimation
        ), 
        onPressed: () {
          close(context, null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blueAccent,
          child: Text(seleccion),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      final listaSugerida = (query.isEmpty) ? lastUsers : users.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

      return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.account_circle,size: 35.0,),
            trailing: Icon(Icons.arrow_right),
            title: Text(listaSugerida[i]),
            onTap: () {
              seleccion = listaSugerida[i];
              showResults(context);
            },
          );
        },
      );
    }

}