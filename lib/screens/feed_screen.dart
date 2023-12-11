import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipesfood/widgets/post_card.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/globalvariable.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
      width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
      appBar: width > webScreenSize
          ? null
          : AppBar(
        leading: IconButton(
            onPressed: () {

            },
            icon:SvgPicture.asset("assets/images/bowl.svg",

              color: Colors.white,)
          //Icon(Icons.account_balance_wallet),
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
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: width > webScreenSize ? width * 0.3 : 0,
                vertical: width > webScreenSize ? 15 : 0,
              ),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
  }

}
