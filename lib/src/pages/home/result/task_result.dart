
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_result.freezed.dart';
 
@freezed
abstract class TaskResult<T> with _$TaskResult<T> {
  factory TaskResult.scess(T company) = Success;
  factory TaskResult.error(String message) = Error;
}
