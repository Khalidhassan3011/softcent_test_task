import 'package:get/get.dart';

abstract class ApiHelper {
  Future<Response> getOTP();

  Future<Response> getTransaction();
}
