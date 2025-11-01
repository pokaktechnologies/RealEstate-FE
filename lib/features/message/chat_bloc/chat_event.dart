import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectChatList extends ChatEvent {
  final String token;
  final String room;
  ConnectChatList(this.token, this.room);
}

class ConnectChatRoom extends ChatEvent {
  final String token;
  final String room;
  ConnectChatRoom(this.token, this.room);
}

class SendMessage extends ChatEvent {
  final Map<String, dynamic> message;
  SendMessage(this.message);
}

class NewChatMessage extends ChatEvent {
  final dynamic message;
  NewChatMessage(this.message);
}
