import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart' as inner;
import 'package:temple/network/api_routes.dart';
import 'package:temple/utils/constants.dart';
import 'package:temple/utils/services.dart';

class ApiRequestOptions {
  final bool showMsg;
  final int? timeout;
  final bool useBaseUrl;
  final bool useGeneralErrorHandler;
  Map<String, String>? headers;

  ApiRequestOptions(
      {this.showMsg = false,
      this.timeout = 60,
      this.useBaseUrl = true,
      this.useGeneralErrorHandler = true,
      this.headers});
}

class ApiResponse<T> {
  T? data;
  bool notSucceeded;
  String? message;
  List<String>? errors;

  bool get hasError => errors!.isNotEmpty;

  ApiResponse(
      {this.notSucceeded = false, this.data, this.message, this.errors});
}

class ApiService {
  static String toQueryString(Map<String, String> map) =>
      map.entries.map((e) => '${e.key}=${e.value}').join('&');

  static Future<ApiResponse<T>> apiRequest<T>(
      String type, String url, dynamic body,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    //......
    //......
    var data;
    Response response;
    try {
      final inner.IOClient _client = getClient();
      final Duration timeout = Duration(seconds: options?.timeout ?? 60);
      Map<String, String> headers = options?.headers ??
          {HttpHeaders.contentTypeHeader: "application/json"};

      // fetch auth_token from storage
      String? authToken = Userdata.userToken;
      if (authToken != null) {
        headers[HttpHeaders.authorizationHeader] = "bearer " + authToken;
      }

      // build querystring
      String queryString = "";
      if (queryParams != null) queryString = "?" + toQueryString(queryParams);

      Uri uri = Uri.parse(url + queryString);
      if ((options?.useBaseUrl ?? true) == true) {
        uri = ApiRoutes.create(url + queryString);
      }

      switch (type.toLowerCase()) {
        case "get":
          response = await _client.get(uri, headers: headers).timeout(timeout);
          break;
        case "post":
          response = await _client
              .post(uri, body: json.encode(body), headers: headers)
              .timeout(timeout);
          break;
        case "put":
          response = await _client
              .put(uri, body: json.encode(body), headers: headers)
              .timeout(timeout);
          break;
        case "patch":
          response = await _client
              .patch(uri, body: json.encode(body), headers: headers)
              .timeout(timeout);
          break;
        case "delete":
          response = await _client
              .delete(uri, body: json.encode(body), headers: headers)
              .timeout(timeout);
          break;
        default:
          throw Exception("Http verb not implemented");
      }

      _client.close();

      // implement a logger library to abstract logs, forward them and control based on build environment
      print("API response :: " +
          response.statusCode.toString() +
          " --> " +
          response.body.toString());

      var decodedRsp = json.decode(response.body.toString());
      List<String> errorList = [];

      if (options != null) {
        data = decodedRsp["data"];
      } else {
        data = decodedRsp["result"];
      }

      var errors = decodedRsp["errors"];
      if (errors != null) errorList = List<String>.from(errors);

      ApiResponse<T> rsp = ApiResponse(
          notSucceeded: decodedRsp["isError"] as bool,
          data: data == null ? null : converter!(data),
          message: decodedRsp["message"].toString(),
          errors: errorList);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.accepted) {
      } else if (response.statusCode == HttpStatus.badRequest) {
        if (options?.showMsg == true) {
          // display generic success message from api
          //toast(msg);
        }
      } else if (response.statusCode == HttpStatus.unauthorized) {
        // clear auth_token from storage

        // route to login screen

      } else if (response.statusCode == HttpStatus.forbidden) {
        // display toast or modal
      } else if (response.statusCode == HttpStatus.notFound) {
        Services().showToast("Resource not found");
      }

      return rsp;
    } catch (e) {
      print(e); // handle from generic logger

      if (options?.useGeneralErrorHandler == true) {
        // display error msg from server, else a generic server error msg
        // "Oops! Something went wrong.."
        return Future.value(
            ApiResponse<T>()); // remove this line afdatater handling with modal
      } else {
        if (data["errors"] != null) {
          print(data["errors"][0]);
          Services().showToast(data["errors"][0]);
        }

        return Future.error(e);
      }
    }
  }

  static Future<ApiResponse<T>> get<T>(String url,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    return await apiRequest<T>("get", url, null,
        queryParams: queryParams, options: options, converter: converter);
  }

  static Future<ApiResponse<T>> post<T>(String url, dynamic data,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    return await apiRequest<T>("post", url, data,
        queryParams: queryParams, options: options, converter: converter);
  }

  static Future<ApiResponse<T>> put<T>(String url, dynamic data,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    return await apiRequest<T>("put", url, data,
        queryParams: queryParams, options: options, converter: converter);
  }

  static Future<ApiResponse<T>> patch<T>(String url, dynamic data,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    return await apiRequest<T>("patch", url, data,
        queryParams: queryParams, options: options, converter: converter);
  }

  static Future<ApiResponse<T>> delete<T>(String url, dynamic data,
      {Map<String, String>? queryParams,
      ApiRequestOptions? options,
      Function? converter}) async {
    return await apiRequest<T>("delete", url, data,
        queryParams: queryParams, options: options, converter: converter);
  }

  static inner.IOClient getClient() {
    bool trustSelfSigned = true;
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    inner.IOClient ioClient = inner.IOClient(httpClient);
    return ioClient;
  }
}
