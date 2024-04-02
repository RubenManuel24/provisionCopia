import 'package:freezed_annotation/freezed_annotation.dart';
 part 'company_sites_result.freezed.dart';
 
@freezed
abstract class CompanySitesModelsResult<T> with _$CompanySitesModelsResult<T> {
  factory CompanySitesModelsResult.sucess(T sitesCompany) = Success;
  factory CompanySitesModelsResult.error(String message) = Error;
}
