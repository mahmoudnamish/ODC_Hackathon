part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class VisibilityState extends RegisterState{}
class PrivacyState extends RegisterState{}

class AccountCreateSuccessful extends RegisterState{}
class AccountCreateError extends RegisterState{}


