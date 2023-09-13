import 'package:codebrikapp/config/http/endpoints.dart';
import 'package:codebrikapp/config/http/http_enum.dart';
import 'package:codebrikapp/config/http/types/http_types.dart';
import 'package:codebrikapp/config/http/types/response.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient.init();

  final Dio _dio = Dio();

  Future<HttpResult<T>> get<T>(
    Endpoints endPoint, {
    required BaseUrl base,
    Map<String, dynamic>? headers,
    QueryParams queryParams,
  }) async {
    return _requestHandler<T>(
      endPoint,
      base,
      queryParameters: queryParams,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
  }

  Future<HttpResult<T>> post<T>(
    Endpoints endPoint,
    dynamic body, {
    required BaseUrl base,
    Map<String, dynamic>? headers,
    QueryParams queryParams,
  }) async {
    if (body is Map) {
      body.removeWhere(
          (key, value) => value == null || value.toString().isNullOrBlank);
    }

    return _requestHandler(
      endPoint,
      base,
      data: body,
      queryParameters: queryParams,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );
  }

  String _getUrl({required Endpoints endpoint, required BaseUrl base}) {
    return base.url + endpoint.url;
  }

  Future<HttpResult<T>> _requestHandler<T>(
    Endpoints endpoint,
    BaseUrl base, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final path = _getUrl(endpoint: endpoint, base: base);

    try {
      print(path);
      final res = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print(res.data);
      final HttpResult<T> result = HttpResult.completed(res.data);

      return result;
    } catch (error) {
      print(error);
      return HttpResult.error(error.toString());
    }
  }
}
