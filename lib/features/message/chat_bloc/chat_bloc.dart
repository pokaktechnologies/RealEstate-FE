import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/services/message/message_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final MessageRepository repository;

  ChatBloc(this.repository) : super(const ChatState()) {
    on<ConnectChatList>(_onConnectChatList);
    on<ConnectChatRoom>(_onConnectChatRoom);
    on<SendMessage>(_onSendMessage);
    on<NewChatMessage>(_onNewChatMessage);
  }

  void _onConnectChatList(ConnectChatList event, Emitter<ChatState> emit) {
    repository.connectChatList(event.token, event.room);
    repository.chatListStream?.listen((data) {
      final decoded = jsonDecode(data);
      add(NewChatMessage(decoded));
    });
    emit(state.copyWith(isConnected: true));
  }

  void _onConnectChatRoom(ConnectChatRoom event, Emitter<ChatState> emit) {
    repository.connectChat(event.token, event.room);
    repository.chatStream?.listen((data) {
      final decoded = jsonDecode(data);
      add(NewChatMessage(decoded));
    });
    emit(state.copyWith(isConnected: true));
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    repository.sendMessage(event.message);
  }

  void _onNewChatMessage(NewChatMessage event, Emitter<ChatState> emit) {
    if (event.message['type'] == 'chat_list') {
      emit(state.copyWith(chatList: [...state.chatList, event.message]));
    } else {
      emit(state.copyWith(messages: [...state.messages, event.message]));
    }
  }

  @override
  Future<void> close() {
    repository.disconnect();
    return super.close();
  }
}
