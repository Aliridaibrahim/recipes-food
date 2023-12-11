import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final List<dynamic> likes;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final String postUrl;
  final String videoUrl;
  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.profImage,
    required this.postUrl,
    required this.videoUrl,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot["description"],
      uid: snapshot["uid"],
      likes: snapshot["likes"] != null ? List<dynamic>.from(snapshot["likes"]) : [],
      postId: snapshot["postId"],
      datePublished: (snapshot["datePublished"] as Timestamp).toDate(),
      username: snapshot["username"],
      profImage: snapshot['profImage'],
      postUrl: snapshot['postUrl'],
      videoUrl: snapshot['videoUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "likes": likes,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    'profImage': profImage,
    'postUrl': postUrl,
    'videoUrl': videoUrl,
  };
}



