import 'package:flutter/material.dart';

showDialogFunc(
    context,
    title,
    ingredients,
    description,

    ) {
  return showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/a.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Scaffold(
              appBar: AppBar(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Food"),
                  ],
                ),

              ),
              backgroundColor: Colors.transparent,
              body: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          height: 30,
                          width: 100,
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 19,
                              color: Colors.black
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          ingredients,
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  // child: Text(description),
                ),
              )),
        );
      });
}
