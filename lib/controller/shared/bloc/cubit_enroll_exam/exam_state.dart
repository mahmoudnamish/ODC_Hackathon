part of 'exam_cubit.dart';

@immutable
abstract class ExamState {}

class ExamInitial extends ExamState {}
class ExamEnrolledSuccessful extends ExamState{}
class ExamEnrolledError extends ExamState{}