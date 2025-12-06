abstract class NetworkInfo {
  Future<bool> hasInternetConnection();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> hasInternetConnection() async {
  
    return true;
  }
}
