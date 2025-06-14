import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/contact_info_model.dart';

abstract class ContactState extends Equatable {
  const ContactState();
  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {}

class ContactError extends ContactState {
  final String error;

  const ContactError(this.error);

  @override
  List<Object?> get props => [error];
}

class ContactLoaded extends ContactState {
  final ContactInfoModel contact;

  const ContactLoaded(this.contact);

  @override
  List<Object?> get props => [contact];
}
