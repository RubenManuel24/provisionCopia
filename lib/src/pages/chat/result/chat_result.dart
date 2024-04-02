import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_result.freezed.dart';
@freezed
abstract class ChatResult<T> with _$ChatResult<T> {
  factory ChatResult.sucess(T message) = Success;
  factory ChatResult.error(String message) = Error;
}
