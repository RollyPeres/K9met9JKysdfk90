import '../../../../shared/shared.dart';
import '../../auth.dart';

class AuthRepository {
  final AuthApiProvider provider = AuthApiProvider();

  Future<AuthModel> postLogin(String jsonBody) {
    return provider.postLogin(jsonBody);
  }

  Future<bool> saveToken(String token) async {
    return await Cache.setCache(key: CACHE_TOKEN_ID, data: token);
  }

  Future<bool> getToken() async {
    return await Cache.getCache(key: CACHE_TOKEN_ID);
  }
}
