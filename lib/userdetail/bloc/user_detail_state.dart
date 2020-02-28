import 'package:meta/meta.dart';

@immutable
abstract class UserDetailState {}

class InitialUserDetailState extends UserDetailState {}

class ValidPersonalDetailState extends UserDetailState{}
class ValidBusinessDetailState extends UserDetailState{}
class ValidAddressDetailState extends UserDetailState{}

