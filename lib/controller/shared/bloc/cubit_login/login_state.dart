part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginStateSuccessful extends LoginState{}
class LoginStateError extends LoginState{}
class LoadingState extends LoginState{}
class VisibilityState extends LoginState{}

