// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  const User({
    required this.uid,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.email,
    required this.username,
    required this.bio,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      photoUrl: snapshot['photoUrl'],
      email: snapshot['email'],
      username: snapshot['username'],
      bio: snapshot['bio'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "followers": followers,
        "following": following,
        "photoUrl": photoUrl,
        "email": email,
        "username": username,
        "bio": bio,
      };
}
