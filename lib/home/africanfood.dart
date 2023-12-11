import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/africanfoodslist.dart';
import 'package:recipesfood/widgets/africanwidget.dart';


class AfricanFood extends StatefulWidget {
  const AfricanFood({Key? key}) : super(key: key);

  @override
  State<AfricanFood> createState() => _AfricanFoodState();
}

class _AfricanFoodState extends State<AfricanFood> {
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<AfricanfoodList>(context,listen: false).fetchTopJawads();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<AfricanfoodList>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes of chef Mehdi')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(AfricanfoodList u){
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
    return AfricanWidget();
  }

}


