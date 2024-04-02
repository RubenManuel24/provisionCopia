import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_model_result.freezed.dart';

@freezed
abstract class HistoryModelResult<T> with _$HistoryModelResult<T>{
  factory HistoryModelResult.sucess(T history) = Sucess;
  factory HistoryModelResult.error(String message) = Error;

}