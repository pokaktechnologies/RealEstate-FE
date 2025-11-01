import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final List<dynamic> chatList;
  final List<dynamic> messages;
  final bool isConnected;

  const ChatState({
    this.chatList = const [],
    this.messages = const [],
    this.isConnected = false,
  });

  ChatState copyWith({
    List<dynamic>? chatList,
    List<dynamic>? messages,
    bool? isConnected,
  }) {
    return ChatState(
      chatList: chatList ?? this.chatList,
      messages: messages ?? this.messages,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [chatList, messages, isConnected];
}
