import 'package:realestate_fe/services/message/message_provider.dart';

class MessageRepository {
  final MessageProvider provider;

  MessageRepository(this.provider);

  void connectChat(String token, String room) =>
      provider.connectToChat(token, room);
  void connectChatList(String token, String room) =>
      provider.connectToChatList(token, room);

  Stream<dynamic>? get chatStream => provider.chatStream;
  Stream<dynamic>? get chatListStream => provider.chatListStream;

  void sendMessage(Map<String, dynamic> message) =>
      provider.sendMessage(message);

  void disconnect() => provider.disconnect();
}
