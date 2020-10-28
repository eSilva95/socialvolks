import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialvolks/src/pages/profile_page.dart';
import 'package:socialvolks/src/search/search_delegate.dart';
import 'package:socialvolks/src/widgets/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: SafeArea(
        child: Scaffold(
            body: _Body(),
            bottomNavigationBar: _Navigation(),
          ),
      ),
    );
  }
}

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          child: Center(child: Text('Comming soon'),),
        ),
        Home(),
        ProfilePage()
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _appBar(context),
        body: Post(['1.jpg','2.jpg','jetta3.jpeg','yo.jpg'])
      )
    );
  }

  Widget _appBar(context) {
    return AppBar(
          elevation: 10.0,
          leading: Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Image.asset(
              'assets/img/volkstoysfb.png', 
              fit: BoxFit.contain
            )
          ),
          title: Text('Volks Toys Club'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        );
  }
}

class _Navigation extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      selectedFontSize: 0.0,
      onTap: (i) => navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: (navigationModel.currentPage == 0) ? Icon(Icons.star, color: Colors.yellow, size: 30.0,) : Icon(Icons.star_outline, color: Colors.yellow,),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.add_a_photo_outlined, color: Colors.yellow,),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: (navigationModel.currentPage == 2) ? Icon(Icons.home, color: Colors.yellow, size: 30.0,) : Icon(Icons.home_outlined, color: Colors.yellow,),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.add_outlined, color: Colors.yellow,),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: (navigationModel.currentPage == 4) ? Icon(Icons.person, color: Colors.yellow, size: 30.0,) : Icon(Icons.person_outline, color: Colors.yellow,),
        ),
      ]
    );
  }
}

class _NavigationModel with ChangeNotifier{
  int _currentPage = 2;
  PageController _pageController = new PageController(initialPage: 1);

  int get currentPage => this._currentPage;
  set currentPage(int value) {
    this._currentPage = value;
    if(value == 0 || value == 2 || value==4){
      switch (value) {
        case 0:
          _pageController.animateToPage(0, duration: Duration(milliseconds: 400), curve: Curves.ease);
          break;
        case 2:
          _pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.ease);
          break;
        case 4:
          _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.ease);
          break;
      }
    }
    notifyListeners();
  }

  PageController get pageController => this._pageController; 
}