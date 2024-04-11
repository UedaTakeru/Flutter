import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/message/message.dart';
import '../domain/repositories/message_repository.dart';

// MessageRepositoryの実装を提供するプロバイダーを定義します。
// 実際のMessageRepositoryImplの実装に基づいて適宜修正してください。
final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  return MessageRepositoryImpl();
});

final messageStateProvider = StateNotifierProvider<MessageState, List<Message>>((ref) {
  return MessageState(ref);
});

class MessageState extends StateNotifier<List<Message>> {
  final Ref _ref;

  MessageState(this._ref) : super([]);

  Future<void> fetchMessages() async {
    final messages = await _ref.read(messageRepositoryProvider).fetchMessages();
    state = messages;
  }

  Future<void> sendMessage(Message message) async {
    await _ref.read(messageRepositoryProvider).sendMessage(message);
    state = [...state, message];
  }
}
