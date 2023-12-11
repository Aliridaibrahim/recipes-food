import 'package:flutter/material.dart';

import 'package:recipesfood/utils/dimensions.dart';
import 'package:recipesfood/widgets/sociallconButton.dart';

import '../widgets/info_card.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 80,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headingCover(context),
              title(text: 'We Here For You'),
              InfoCard(
                text: "Our Vission",
                imageUrl: ToolsUtilities.imageRcipe[6],
              ),
              InfoCard(
                text: "Our Mission",
                imageUrl: ToolsUtilities.imageRcipe[3],
              ),
              title(text: "Follow Us",),
              const SocialIconButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headingCover(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ToolsUtilities.mainColor,
            image: DecorationImage(
              image: NetworkImage(
                ToolsUtilities.imageRcipe[9],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

Padding title({text}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        color: ToolsUtilities.mainColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
