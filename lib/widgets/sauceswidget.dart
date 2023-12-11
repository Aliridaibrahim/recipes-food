import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/ViewModel/salad.dart';
import 'package:recipesfood/widgets/showDialogFunc.dart';

import '../ViewModel/saucelist.dart';



class SaucesWidget extends StatefulWidget {
  const SaucesWidget({Key? key}) : super(key: key);

  @override
  State<SaucesWidget> createState() => _SaucesWidgetState();
}

class _SaucesWidgetState extends State<SaucesWidget> {
  @override
  Widget build(BuildContext context) {
    final datt = Provider.of<SauceList>(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/a.jpg',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                        itemCount: datt.foods.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                //   splashColor: Colors.black26,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Align(
                                        child: _buildImage(context, index),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Stack(
                                        children: [
                                          Align(
                                            child: Padding(
                                                padding: const EdgeInsets
                                                    .fromLTRB(
                                                    150, 0, 0, 0),
                                                child: GestureDetector(
                                                  child: Text(
                                                    datt.foods[index]
                                                        .title as String,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                  onTap: () {
                                                    showDialogFunc(context,
                                                        datt.foods[index]
                                                            .title,
                                                        datt.foods[index]
                                                            .ingredients
                                                        , datt.foods[index]
                                                            .description);
                                                  },
                                                )),
                                          ),
                                          const Align(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 20, 250, 5),
                                              child: Text("Show More",
                                                  style:
                                                  TextStyle(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  )));
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(BuildContext context, int index) {
  final datt = Provider.of<SauceList>(context);
  try {
    return Image.network(
      datt.foods[index].picture as String,
      errorBuilder: (BuildContext context, Object exception,
          StackTrace? stackTrace) {
        return const Image(image: AssetImage('assets/images/image-2.png'));
      },
      fit: BoxFit.cover,
      height: 230,
      width: 450,
    );
  } catch (e) {
    print(e);
    return const Image(image: AssetImage('assets/images/image-2.png'));
  }
}



