import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/messages.dart';


class MessagesRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    await _db
        .collection("chat_rooms")
        .doc("5wIEF4qSGhFMKms4Pjuu")
        .collection("texts")
        .add(
      message.toJson(),
    );
  }
}

final messagesRepo = Provider(
      (ref) => MessagesRepo(),
);