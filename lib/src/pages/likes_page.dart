import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Likes'),
      ),
      body: LikesList(),
      );
  }
}

class LikesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              title: Text('Username'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/img/volkstoysfb.png'),
              ),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                onPressed: (){}, 
                child: Container(
                  width: 50.0,
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 12.0,),
                      Text('Follow', style: TextStyle(fontSize: 12.0),),
                    ],
                  ),
                )
              ),
            ),
            Divider()
          ],
        );
      },
    );
  }
}