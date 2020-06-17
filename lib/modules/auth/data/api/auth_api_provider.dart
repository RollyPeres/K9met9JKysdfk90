import '../../../../shared/shared.dart';
import '../data.dart';

class AuthApiProvider{
  final network = Network();
  
  Future<AuthModel> postLogin(String jsonBody)async{
    final String url = '$BASE_URL_API/$API_VERSION/$SELLER_RESOURCE/$AUTH_SOURCE/$LOGIN_SOURCE';
    final response = await network.postRequest(url, jsonBody);
    if(response.statusCode == 200){
      final body = authModelFromJson(response.body);
      return body;
    }else{
      return null;
    }
  }
}