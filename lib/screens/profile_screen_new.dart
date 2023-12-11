import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipesfood/screens/new_profilescreen.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';


class ProfileScreenNew extends StatelessWidget {
  const ProfileScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: NewProfile(uid: FirebaseAuth.instance.currentUser!.uid),



    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: Text("Profile"),
      actions: <Widget>[
        TextButton( // Use TextButton instead of FlatButton
          onPressed: () {},
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.defaultSize * 1.6, //16
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

}
