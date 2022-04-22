import 'dart:async';

import '../common/util/exports.dart';
import 'interceptor.dart';

class ApiHelperImpl extends GetConnect with ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> getOTP() async {
    return await get("9a3d57b9-fa3f-402e-99f9-982134108d18");
  }
}