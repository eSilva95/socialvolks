import 'package:flutter/material.dart';
import 'package:socialvolks/src/icons/app_icons.dart';

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Stack(
        children: [
          CommentsList(),
          CommentInput(),
        ],
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50.0)
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Comment',
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 5.0),
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/yo.jpg'),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send), 
                  onPressed: (){}
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommentsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    var listview = ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              title: Text('Username'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/img/volkstoysfb.png'),
              ),
              trailing: IconButton(icon: Icon(AppIcons.like), onPressed: (){}),
              subtitle: Text('Aquí se mostrará el comentario realizado'),
            ),
            Divider()
          ],
        );
      },
    );

    return Container(
      height: _size.height * 0.8,
      child: listview,
    );
  }
}