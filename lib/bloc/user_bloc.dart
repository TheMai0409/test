import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/user_model.dart';
import '../repository/api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository _apiRepository;
  List<UserModel> lists = [];
  UserBloc()
      : _apiRepository = ApiRepository(),
        super(UserInitial()) {
    on<GetUsers>(_mapToStateGetUsers);
    on<DeleteUser>(_mapToStateDeleteUser);
  }

  void _mapToStateGetUsers(GetUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      lists = await _apiRepository.getUsers();
      emit(UserLoaded(lists));
    } catch (_) {}
  }

  void _mapToStateDeleteUser(DeleteUser event, Emitter<UserState> emit) {
    emit(UserLoading());
    lists.removeWhere((element) => element.id == event.id);
    emit(UserDelete(lists));
  }
}
