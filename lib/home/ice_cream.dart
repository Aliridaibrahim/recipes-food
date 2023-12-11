import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/icecremlist.dart';
import 'package:recipesfood/widgets/icecreamwidget.dart';


class IceCream extends StatefulWidget {
  @override
  _IceCreamState createState() => _IceCreamState();
}

class _IceCreamState extends State<IceCream> {
  @override
  void initState() {
    super.initState();
    Provider.of<IcecreamList>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<IcecreamList>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(IcecreamList u){
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
    return IceWidget();
  }

}
