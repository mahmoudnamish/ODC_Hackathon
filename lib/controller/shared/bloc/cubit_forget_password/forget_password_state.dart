part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordSuccessful extends ForgetPasswordState {}
class ForgetPasswordError extends ForgetPasswordState {}
class VisibilityState extends ForgetPasswordState {}


