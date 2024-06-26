
abstract class AuthRepo {
  Future<void> signIn(String url,Map<String,String>data);
  Future<void> signUp(String url,Map<String,String>data);
  Future<void> signOut();
}
