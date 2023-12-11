import 'package:flutter/material.dart';


import '../screens/info_screen.dart';
import '../utils/dimensions.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  const InfoCard({ required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(text: text),
          Card(
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    ToolsUtilities.descriptionPargraph,
                    style: TextStyle(
                      fontSize: 18,
                     color: Colors.white
                     // color: ToolsUtilities.secondColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
