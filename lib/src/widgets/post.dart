import 'package:flutter/material.dart';
import 'package:socialvolks/src/icons/app_icons.dart';

class Post extends StatelessWidget {

  final List posts;
  
  const Post(this.posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
      return PostItem(images: posts,index: index,);
     },
    );
  }
}

class PostItem extends StatelessWidget {
  final int index;
  final List images;

  const PostItem({this.index, this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Profile(),
        _Description(index),
        _ImagePost(images, index),
        _Actions(),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/yo.jpg'),
            ),
          ),
          Text('Volkstoys Tepic - UserName')
        ],
        ),
      );
  }
}

class _Description extends StatelessWidget {
  final int index;

  const _Description(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Text('Description ${index+1}', style: TextStyle(fontSize: 15.0),)
    );
  }
}

class _ImagePost extends StatelessWidget {
  final List images;
  final int index;
  _ImagePost(this.images, this.index);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          width: _size.width,
          color: Colors.black,
          constraints: BoxConstraints(
            maxHeight: 480.0
          ),
          child: FadeInImage(
            fit: BoxFit.contain,
            placeholder: AssetImage('assets/img/loading.gif'), 
            image: AssetImage('assets/img/${images[index]}')
          ),
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 5.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap:() => _createDialog(context, LikesDialog()),
                  child: Text('0 me gusta')
                ),
                SizedBox(width: 15.0),
                GestureDetector(
                  onTap: () => _createDialog(context, CommentsDialog()),
                  child: Text('0 Comentarios')
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Row(
              children: [
                IconButton(icon: Icon(AppIcons.like, size: 40.0), onPressed: (){}),
                SizedBox(width: 5.0,),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () => _createDialog(context, CommentsDialog())
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

_createDialog(BuildContext context, widget) async {
  await showGeneralDialog(
    context: context, 
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.fastLinearToSlowEaseIn.transform(a1.value) - 1.0;

      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: widget
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, a1, a2) => widget
  );
}

class CommentsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final _size = MediaQuery.of(context).size;
    TextEditingController _commentTextFieldController = new TextEditingController();

    return Center(
      child: SingleChildScrollView(
        reverse: true,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Center(
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), topLeft: Radius.circular(50))
                    ),
                    height: 480.0,
                      child: Center(
                        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text('Comments'),
                              )
                            );
                          },
                          itemCount: 1,
                        ),
                      )
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: TextField(
                        controller: _commentTextFieldController,
                        decoration: InputDecoration(
                          hintText: 'Comment',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send), 
                            onPressed: (_commentTextFieldController.text.isNotEmpty) ? null : (){},
                            splashRadius: 5.0,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LikesDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _size = MediaQuery.of(context).size;
    return Center(
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), topLeft: Radius.circular(50))
          ),
          height: 480.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/volkstoysfb.png'),
                ),
                title: Text('Username'),
                trailing: IconButton(
                  icon: Icon(Icons.add), 
                  tooltip: 'Follow',
                  onPressed: (){}
                ),
                onTap: (){},
              );
            },
            itemCount: 10,
          )
        ),
      ),
    );
  }
}