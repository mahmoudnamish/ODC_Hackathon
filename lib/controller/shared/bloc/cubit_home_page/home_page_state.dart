part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}
class ChangeIndexState extends HomePageState {}
class GetCategoriesSuccessful extends HomePageState {}
class GetCategoriesError extends HomePageState {}
class GetCourseSuccessful extends HomePageState {}
class GetCourseError extends HomePageState {}
class GetProfileSuccessful extends HomePageState {}
class GetProfileError extends HomePageState {}
class LogOutSuccessful extends HomePageState {}
class LogOutError extends HomePageState {}
class GetCategoriesIDSuccessful extends HomePageState {}
class GetCategoriesIDError extends HomePageState {}



