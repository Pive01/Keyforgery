// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GoogleSheetApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GoogleSheetApi implements GoogleSheetApi {
  _GoogleSheetApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://script.google.com/macros/s/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ExpansionWrapper> getAllExpansions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ExpansionWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'AKfycby9FjaR_w4T-jqeW_93MtEcd_pyGQ5GMaIzd_3B41eawzDgHm72tkveS6Br3hrUZqd3/exec',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExpansionWrapper.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
