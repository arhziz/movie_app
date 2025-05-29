// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:formz/formz.dart';

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum SearchParamValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template search_param}
/// Form input for a search param input.
/// {@endtemplate}
class SearchParam extends FormzInput<String, SearchParamValidationError> {
  /// {@macro confirmed_password}
  const SearchParam.pure() : super.pure('');

  /// {@macro confirmed_password}
  const SearchParam.dirty([super.value = '']) : super.dirty();

  @override
  SearchParamValidationError? validator(String? value) {
    /// A search param must not be empty.
    /// This is a simple validation that checks if the value is not empty.
    return value?.isNotEmpty == true
        ? null
        : SearchParamValidationError.invalid;
  }
}
