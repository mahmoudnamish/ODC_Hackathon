import '../../controller/shared/shared_prefrance/sheard_perafrance.dart';

class GetCacheData{
  get token{
    return CacheHelper.getDataString(key: 'token',);
  }
  get refreshToken{
    return CacheHelper.getDataString(key: 'refresh_token',);
  }
}