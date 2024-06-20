import 'package:imei/config/result.dart';

abstract interface class IAuthReposotory<T> {
  Future<Result<T, Object>> login(
      {required String email, required String password});
  Future<Result<T, Object>> register(
      {required String email,
      required String userName,
      required String password});
}
