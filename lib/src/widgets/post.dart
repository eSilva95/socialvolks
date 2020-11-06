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

class _ImagePost extends StatefulWidget {
  final List images;
  final int index;
  _ImagePost(this.images, this.index);

  @override
  __ImagePostState createState() => __ImagePostState();
}

class __ImagePostState extends State<_ImagePost> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final transformationController = TransformationController();

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
          child: InteractiveViewer(
            transformationController: transformationController,
            onInteractionEnd: (details) {
              setState(() {
                transformationController.toScene(Offset.zero);
              });
            },
            child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: AssetImage('assets/img/loading.gif'), 
              image: AssetImage('assets/img/${widget.images[widget.index]}')
            ),
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
                  onTap:() => Navigator.pushNamed(context, 'likes'),
                  child: Text('0 me gusta')
                ),
                SizedBox(width: 15.0),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'comments'),
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
                  onPressed: () => Navigator.pushNamed(context, 'comments')
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