import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methodes.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/util.dart';
import '../widgets/profile_menu_item.dart';
import 'login_screen.dart';

class NewProfile extends StatefulWidget {
  final String uid;
  const NewProfile({Key? key, required this.uid}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
return SingleChildScrollView(
  child: userData['photoUrl'] != null && userData['username'] != null && userData['bio'] != null
      ? Column(
    children: <Widget>[
      SizedBox(
        height: defaultSize * 24,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: defaultSize * 15,
                color: kPrimaryColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: defaultSize),
                    height: defaultSize * 14,
                    width: defaultSize * 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: defaultSize * 0.8,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(userData['photoUrl']),
                      ),
                    ),
                  ),
                  SizedBox(height: defaultSize / 2),
                  Container(
                    child: Text(
                      userData['username'],
                      style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      userData['bio'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8492A2),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: SizeConfig.defaultSize * 2),
      ProfileMenuItem(
        iconSrc: "assets/images/bookmark_fill.svg",
        title: "Saved Recipes",
        press: () {},
      ),
      ProfileMenuItem(
        iconSrc: "assets/images/chef_nav.svg",
        title: "Super Plan",
        press: () {},
      ),
      ProfileMenuItem(
        iconSrc: "assets/images/language.svg",
        title: "Change Language",
        press: () {},
      ),
      ProfileMenuItem(
        iconSrc: "assets/images/info.svg",
        title: "Help",
        press: () {},
      ),
      ProfileMenuItem(
        iconSrc: "assets/images/info.svg",
        title: "Logout",
        press: () async {
          await AuthMethods().signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen(),)

          );
        },
      ),
    ],
  )
      : const Center(child: CircularProgressIndicator()),
);
  }
}
  class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
  var path = Path();
  double height = size.height;
  double width = size.width;
  path.lineTo(0, height - 100);
  path.quadraticBezierTo(width / 2, height, width, height - 100);
  path.lineTo(width, 0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
  return true;
  }
  }


