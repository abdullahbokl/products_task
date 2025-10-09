import 'base_app_exception.dart';

class CacheExceptions extends BaseAppException {
  CacheExceptions({required super.message});

  factory CacheExceptions.fromException(Exception e) {
    return CacheExceptions(message: e.toString());
  }

  factory CacheExceptions.fromError(Error e) {
    return CacheExceptions(message: e.toString());
  }
}
