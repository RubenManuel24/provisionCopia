import 'package:freezed_annotation/freezed_annotation.dart';
 part 'supervision_model_result.freezed.dart';
 
@freezed
abstract class SupervisionModelResult<T> with _$SupervisionModelResult<T> {
  factory SupervisionModelResult.sucess(T company) = Success;
  factory SupervisionModelResult.error(String message) = Error;
}
