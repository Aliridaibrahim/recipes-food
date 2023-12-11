
import 'package:flutter/material.dart';
import 'package:recipesfood/home/body.dart';
import 'package:svg_flutter/svg.dart';
import '../utils/dimensions.dart';


class HomeScreeng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {

          },
        icon:SvgPicture.asset("assets/images/bowl.svg",

          color: Colors.white,)
      ),
      centerTitle: true,
      title:
      Image.asset("assets/images/logo.png"),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/images/bowl.svg",
           color: Colors.white,),
          onPressed: () {


          },
        ),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }
}
