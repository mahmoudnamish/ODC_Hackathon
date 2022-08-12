part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileSuccessful extends ProfileState {}
 class ProfileError extends ProfileState {}

