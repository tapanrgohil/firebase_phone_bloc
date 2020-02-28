import 'package:flutter/material.dart';

@immutable
class AppState {
  final dynamic user;

  AppState({@required this.user});

  factory AppState.init() {
    return AppState(user: null);
  }
}
