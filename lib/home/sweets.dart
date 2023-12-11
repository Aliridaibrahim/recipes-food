import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/salad.dart';
import 'package:recipesfood/ViewModel/sweetslist.dart';
import 'package:recipesfood/widgets/saladwidget.dart';

import '../widgets/sweetswidget.dart';

class Sweets extends StatefulWidget {
  @override
  _SweetsState createState() => _SweetsState();
}

class _SweetsState extends State<Sweets> {
  @override
  void initState() {
    super.initState();
    Provider.of<Sweetslist>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<Sweetslist>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(Sweetslist u){
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
    return  SweetsWidget();
  }

}

