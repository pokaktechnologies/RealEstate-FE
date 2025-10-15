import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/contact_model.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
  @override
  List<Object?> get props => [];
}

class PostContactEvent extends ContactEvent {
  final ContactData contactData;

  const PostContactEvent(this.contactData);

  @override
  List<Object?> get props => [contactData];
}

class GetContactEvent extends ContactEvent {}
