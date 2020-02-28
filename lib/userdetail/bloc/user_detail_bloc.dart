import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  @override
  UserDetailState get initialState => InitialUserDetailState();

  @override
  Stream<UserDetailState> mapEventToState(
    UserDetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
