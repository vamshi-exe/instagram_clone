// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profImage;
  final likes; 

  const Post({
    required this.description, 
    required this.uid,
    required this.username,
    required this.postId, 
    required this.datePublished, 
    required this.postUrl, 
    required this.profImage,
    required this.likes, 
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profImage': profImage,
      'likes':likes,
    };
  }

  

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot['description'], 
      postId: snapshot['postId'], 
      datePublished: snapshot['datePublished'], 
      postUrl: snapshot['postUrl'], 
      profImage: snapshot['profImage'], 
      uid: snapshot['uid'], 
      username: snapshot['username'],
      likes: snapshot['likes'],
      );

    
  

  

 }
}
