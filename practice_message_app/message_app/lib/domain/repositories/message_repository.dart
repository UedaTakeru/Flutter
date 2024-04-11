import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/message/message.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<List<Message>> fetchMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messagesString = prefs.getString('messages');
    if (messagesString != null) {
      final List<dynamic> jsonList = json.decode(messagesString) as List<dynamic>;
      return jsonList.map((json) => Message.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> sendMessage(Message message) async {
    final prefs = await SharedPreferences.getInstance();
    final messages = await fetchMessages();
    messages.add(message);
    final String updatedMessagesString = json.encode(messages.map((m) => m.toJson()).toList());
    await prefs.setString('messages', updatedMessagesString);
  }
}

abstract class MessageRepository {
  Future<List<Message>> fetchMessages();
  Future<void> sendMessage(Message message);
}

