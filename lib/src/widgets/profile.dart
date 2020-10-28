import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    List images = ['1.jpg','2.jpg','jetta3.jpeg','yo.jpg','1.jpg','2.jpg','jetta3.jpeg','yo.jpg','1.jpg','2.jpg','jetta3.jpeg','yo.jpg','1.jpg','2.jpg','jetta3.jpeg','yo.jpg',];
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        _ImageProfile(),
        _Footer(),
        Divider(height: 20.0,),
        Container(
          width: _size.width,
          height: _size.height * 0.53,
          child: GridView.builder(
            itemCount: images.length,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'image', arguments: images[index]),
                child: Container(
                  margin: EdgeInsets.all(1.0),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/img/loading.gif'), 
                    image: AssetImage('assets/img/${images[index]}')
                  )
                  // Image.asset('assets/img/${images[index]}')
                ),
              );
            },
          ),
        )
        
      ],
    );
  }
}

// var gridView = new GridView.builder(
//         itemCount: 20,
//         gridDelegate:
//             new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         itemBuilder: (BuildContext context, int index) {
//           return new GestureDetector(
//             child: new Card(
//               elevation: 5.0,
//               child: new Container(
//                 alignment: Alignment.center,
//                 child: new Text('Item $index'),
//               ),
//             ),
//           );
//         });

class _Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.57,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'VolksToys Tepic', 
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0 Seguidores'),
              SizedBox(width: 10.0,),
              Text('0 Seguidos'),
              SizedBox(width: 10.0,),
              Text('16 Posts')
            ],
          )
        ],
      )
    );
  }
}

class _ImageProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.add_a_photo), 
                onPressed: (){},
              )
            ),
            backgroundImage: AssetImage('assets/img/yo.jpg'),
            radius: 60.0,
          ),
        ],
      ),
    );
  }
}