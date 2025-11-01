import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageProvider {
  WebSocketChannel? _chatChannel;
  WebSocketChannel? _chatListChannel;

  /// Connect to specific chat (room)
  void connectToChat(String token, String room) {
    final url = 'ws://93.127.167.39:8001/ws/chat/?token=$token&room=$room';
    _chatChannel = IOWebSocketChannel.connect(Uri.parse(url));
  }

  /// Connect to chat list
  void connectToChatList(String token, String room) {
    final url = 'ws://93.127.167.39:8001/ws/chat_list/?token=$token&room=$room';
    _chatListChannel = IOWebSocketChannel.connect(Uri.parse(url));
  }

  /// Stream for receiving chat messages
  Stream<dynamic>? get chatStream => _chatChannel?.stream;

  /// Stream for receiving chat list updates
  Stream<dynamic>? get chatListStream => _chatListChannel?.stream;

  /// Send message to chat
  void sendMessage(Map<String, dynamic> message) {
    if (_chatChannel != null) {
      _chatChannel!.sink.add(jsonEncode(message));
    }
  }

  /// Close WebSocket connections
  void disconnect() {
    _chatChannel?.sink.close();
    _chatListChannel?.sink.close();
  }
}
