import 'package:freezed_annotation/freezed_annotation.dart';
 part 'company_model_result.freezed.dart';
 
@freezed
abstract class CompanyModelResult<T> with _$CompanyModelResult<T> {
  factory CompanyModelResult.sucess(T company) = Success;
  factory CompanyModelResult.error(String message) = Error;
}
