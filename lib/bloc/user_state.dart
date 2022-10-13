part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;
  const UserLoaded(this.users);
}

class UserDelete extends UserState{
  final List<UserModel> users;
  const UserDelete(this.users);
}