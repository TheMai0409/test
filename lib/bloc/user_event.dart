part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UserEvent {}

class DeleteUser extends UserEvent {
  final int id;
  const DeleteUser(this.id);
}
