import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/salad.dart';
import 'package:recipesfood/widgets/saladwidget.dart';

class Arabicfood extends StatefulWidget {
  @override
  _ArabicfoodState createState() => _ArabicfoodState();
}

class _ArabicfoodState extends State<Arabicfood> {
  @override
  void initState() {
    super.initState();
    Provider.of<SAladist>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<SAladist>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(SAladist u){
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
    return const Saladwidget();
  }

}

