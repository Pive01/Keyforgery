// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TheCrucibleApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TheCrucibleApi implements TheCrucibleApi {
  _TheCrucibleApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://thecrucible.online/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TokenWrapper> getAuthorization(usr) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usr.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TokenWrapper>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'account/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TokenWrapper.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoggedTokenWrapper> refreshAuthorization(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(token.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoggedTokenWrapper>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'account/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoggedTokenWrapper.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CrucibleDecksWrapper> getCrucibleDecks(auth) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': auth};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CrucibleDecksWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'decks?pageSize=1000&page=1&sort=lastUpdated&sortDir=desc',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CrucibleDecksWrapper.fromJson(_result.data!);
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
