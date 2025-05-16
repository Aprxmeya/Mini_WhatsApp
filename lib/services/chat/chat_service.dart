import 'package:chat_app_final/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String,dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> sendMessage(String receiverID, String message) async {
    final String currentuserid = _auth.currentUser!.uid;
    final String currentuseremail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(
      senderid: currentuserid,
      senderemail: currentuseremail,
      receiverid: receiverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentuserid, receiverID];
    ids.sort();
    String chatroomID = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatroomID)
        .collection("messages")  // Use "messages" here
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userid, String otheruserid){
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatroomid)
        .collection("messages")  // Use "messages" here as well
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
