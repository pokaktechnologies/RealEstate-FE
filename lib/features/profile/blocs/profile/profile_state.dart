import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  const ProfileLoaded(this.profileModel);
}

class ProfileError extends ProfileState {
  final String? message;
  const ProfileError(this.message);
}
