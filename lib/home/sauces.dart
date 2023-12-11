import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/saucelist.dart';
import 'package:recipesfood/widgets/sauceswidget.dart';

class Sauces extends StatefulWidget {
  const Sauces({Key? key}) : super(key: key);

  @override
  State<Sauces> createState() => _SaucesState();
}

class _SaucesState extends State<Sauces> {
  @override
  void initState() {
    super.initState();
    Provider.of<SauceList>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<SauceList>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(SauceList u){
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
    return SaucesWidget();
  }

}
