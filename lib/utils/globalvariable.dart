
import 'package:flutter/material.dart';
import 'package:recipesfood/screens/login_screen.dart';
import 'package:recipesfood/screens/profile_screen_new.dart';

import '../home/new_home_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/info_screen.dart';
import '../screens/signup_screen.dart';






const webScreenSize = 600;

List<Widget>
homeScreenItems = [
  HomeScreeng(),
  FeedScreen(),
  AddPostScreen(),
 // LoginScreen(),
 // SignupScreen(),
  InfoScreen(),
  const ProfileScreenNew(),
];
