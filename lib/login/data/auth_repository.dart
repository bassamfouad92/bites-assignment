import 'package:bites_assignment/common/enum/api_status.dart';
import 'package:bites_assignment/common/model/exceptions.dart';
import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:bites_assignment/login/data/auth_response.dart';

import '../../common/network/http/network_service.dart';

abstract interface class AuthRepository {
  Future<bool> login(Map<String, dynamic> params);
}

class AuthRepositoryImpl implements AuthRepository {
  final NetworkService _networkService;
  final UserSession _userSession;

  AuthRepositoryImpl(this._networkService, this._userSession);

  @override
  Future<bool> login(Map<String, dynamic> params) async {
    final response =
        await _networkService.post('/login', // Endpoint for the login API
            data: params);
    try {
      final status = response.statusCode as int;
      if (status.toApiStatus() == ApiStatus.success) {
        final authResponse = AuthResponse.fromJson(response.data);
        _networkService.updateHeader({'Authorization': authResponse.token});
        await _userSession.saveToken(authResponse.token);
        return true;
      } else {
        throw NotFoundException();
      }
    } catch (ex) {
      throw APIFailedException();
    }
  }
}
