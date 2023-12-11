import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipesfood/resources/firestore_methods.dart';
import 'package:recipesfood/utils/colors.dart';
import 'package:recipesfood/utils/dimensions.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:video_player/video_player.dart';

import '../provider/userprovider.dart';
import '../utils/util.dart';

class AddPostScreen extends StatefulWidget {

  const AddPostScreen({Key? key}) : super(key: key);
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  File? _videoFile;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;


  @override
  void dispose() {
    _descriptionController.dispose();
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List? file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  Future<Uint8List?> pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final videoBytes = await pickedFile.readAsBytes();
      return videoBytes.buffer.asUint8List();
    }
    return null;
  }


  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
      try {
        String res = await FireStoreMethods().uploadPost(
          _descriptionController.text,
          _file!,
          uid,
          username,
          profImage,
          _videoFile,
        );

      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        if (context.mounted) {
          showSnackBar(
            context,
            'Posted!',
          );
        }
        clearImage();
      } else {
        if (context.mounted) {
          showSnackBar(context, res);
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }
  void clearImage() {
    setState(() {
      _file = null;
      _videoController?.dispose();
      _videoController?.dispose();
    });
  }



  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Scaffold(appBar: AppBar(
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
      body:Container(child:    Center(

        child: IconButton(
          icon: const Icon(
            Icons.upload,
            color: Colors.black,
          ),
          onPressed: () => _selectImage(context),

        ),

      ),
      ),

        )
        : Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back , color: Colors.black,),
          onPressed: clearImage,
        ),
        title: const Text(
          'Post to',
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () => postImage(
              userProvider.getUser.uid,
              userProvider.getUser.username,
              userProvider.getUser.photoUrl,
             // userProvider.getUser.mediaUrl
            ),
            child: const Text(
              "Post",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      // POST FORM
      body: Column(
        children: <Widget>[
          isLoading
              ? const LinearProgressIndicator()
              : const Padding(padding: EdgeInsets.only(top: 0.0)),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userProvider.getUser.photoUrl,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      hintText: "Write a caption...",
                      border: InputBorder.none),
                  maxLines: 8,
                ),
              ),

              SizedBox(
                height: 45.0,
                width: 45.0,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                          image: MemoryImage(_file!),
                        )
    ),
                  ),
                ),
                )

            ],
          ),

        ],
      ),
    );
  }
}
