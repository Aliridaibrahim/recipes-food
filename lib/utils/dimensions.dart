import 'package:flutter/material.dart';

class ToolsUtilities {
  static final mainColor = Color(0xFF000000);
  static final secondColor = Color(0xFFFFFFFF);
  static final whiteColor = Color(0xffffffff);
  static const ourVisionPargraph =
      'It is important to take care of the patient, to be followed by the patient, '
      'but it will happen at such a time that there is a lot of work and pain. '
      'For to come to the smallest detail, no one should practice any kind of work unless he derives some benefit from it. Do not let the pain of the house go astray, let it be a hairs breadth away from the pain of joy';
  static const descriptionPargraph =
  '''Cut the tomatoes and the onion into small pieces Boil some water  add salt to it once it boils Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes In the meantime, heaten up some olive oil and add the cut onion After 2 minutes, add the tomato pieces, salt, pepper and your other spices The sauce will be done once the spaghetti.''';
  static List imageRcipe = [
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1488900128323-21503983a07e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDF8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1429554513019-6c61c19ffb7e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTF8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1541401154946-62f8d84bd284?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fGZvb2QlMjBkZWxpdmVyeXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
}


class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

