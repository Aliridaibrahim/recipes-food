import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/foodlist.dart';
import '../widgets/foodwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<BooksList>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<BooksList>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(BooksList u){
    if(u.foods == false) {
      return const Align(child: CircularProgressIndicator());
    } else if(u.foods.isEmpty) {
      return const Align(child: Text("Loading....",style: TextStyle(
        fontWeight:FontWeight.bold ,
          fontSize: 15,
          color: Colors.black
      ),));
    } else {
      return _bookslist(context);
    }
  }

  Widget _bookslist(BuildContext context) {
    return FoodWidget();
  }

}
