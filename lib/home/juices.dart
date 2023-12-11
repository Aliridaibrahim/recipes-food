import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/juiceslist.dart';
import 'package:recipesfood/widgets/juiseswidget.dart';

class Juices extends StatefulWidget {
  @override
  _JuicesState createState() => _JuicesState();
}

class _JuicesState extends State<Juices> {
  @override
  void initState() {
    super.initState();
    Provider.of<Juiceslist>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<Juiceslist>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(Juiceslist u){
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
    return const JuicesWidget();
  }

}

